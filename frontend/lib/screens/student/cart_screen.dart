import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/fcm_token_provider.dart';
import 'package:frontend/providers/stall_provider.dart';
import 'package:frontend/screens/student/add_name_modal.dart';

import '../../services/firebase/firebase_service.dart';
import '../../shared/back_button_container.dart';
import '../../shared/item_cart.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    if (ref.read(nameProvider) == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAddNameModal(context);
      });
    }
  }

  void _showAddNameModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AddNameModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final totalPrice = ref.watch(orderPriceNotifierProvider);
    final orderService = ref.watch(orderServiceProvider);
    final selectedStall = ref.watch(selectedStallProvider);
    final currentUser = ref.watch(nameProvider);
    final ScrollController _scrollController = ScrollController();
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: const Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: cartProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Slidable(
                    key: ValueKey(cartProducts.elementAt(index).productID),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            setState(() {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .removeProduct(cartProducts.elementAt(index));
                            });
                          },
                          icon: Icons.delete,
                          label: "Delete",
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9644),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ItemCart(
                        index: index,
                        item: cartProducts.elementAt(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 100,
            width: screenWidth,
            color: const Color(0xFFFFC570).withValues(alpha: 0.8),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: SizedBox()),
                  Text(
                    "${totalPrice.toStringAsFixed(2)} PHP",
                    style: const TextStyle(
                      fontFamily: 'Flame',
                      fontSize: 20,
                      color: Color(0xFF5D371A),
                    ),
                  ),
                  const Expanded(flex: 5, child: SizedBox()),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 3,
                    width: 30,
                    indent: 23,
                    endIndent: 23,
                  ),
                  GestureDetector(
                    onTap: _isButtonEnabled ? () async {
                      if (!_isButtonEnabled) return;
                      setState(() {
                        _isButtonEnabled = false;
                      });

                      if (cartProducts.isNotEmpty) {
                        var checkoutResponse = await orderService.checkout(
                          selectedStall!.stallID!,
                          currentUser,
                        );
                        var addOrderLineToDB = await orderService.insertItems(
                          checkoutResponse['order_id'],
                          cartProducts,
                        );
                        var submitOrder = await orderService.submitOrder(
                          checkoutResponse['order_id'],
                          addOrderLineToDB,
                        );
                        final token = ref.read(fcmTokenNotifierProvider);
                        await orderService.saveFCM(checkoutResponse['order_id'], token!);
                        ref.read(cartNotifierProvider.notifier).resetCart();
                        ref
                            .read(cartNotifierProvider.notifier)
                            .writeReceipt(
                              selectedStall.stallID!,
                              checkoutResponse['order_number'],
                              cartProducts,
                            );
                        Navigator.of(context).pushNamed("/order_successful");

                        await Future.delayed(const Duration(seconds: 3));
                        if (mounted) {
                          setState(() {
                            _isButtonEnabled = true;
                          });
                        }
                      }
                    } : null,
                    child: Container(
                      height: 52,
                      width: 153,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9644).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            color: Color(0xFF5D371A),
                            fontFamily: 'Flame',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
