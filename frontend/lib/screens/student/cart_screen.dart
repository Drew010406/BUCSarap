import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frontend/main.dart';
import 'package:frontend/providers/cart_provider.dart';

import '../../shared/back_button_container.dart';
import '../../shared/item_cart.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final totalPrice = ref.watch(orderPriceNotifierProvider);

    final ScrollController _scrollController = ScrollController();
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar:AppBar(
          toolbarHeight: 110,
          backgroundColor: Color(0xFFEFE2D3),
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
                // https://www.geeksforgeeks.org/flutter/flutter-slidable/
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            setState(() {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .removeProduct(
                                cartProducts.elementAt(index),
                              );
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9644),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ItemCart(index: index,)
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 100,
            width: screenWidth,
            color: Color(0xFFFFC570).withValues(alpha: 0.8),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    "${totalPrice.toStringAsFixed(2)} PHP",
                    style: TextStyle(
                      fontFamily: 'Flame',
                      fontSize: 20,
                      color: Color(0xFF5D371A),
                    ),
                  ),
                  Expanded(flex: 5,child: SizedBox()),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 3,
                    width: 30,
                    indent: 23,
                    endIndent: 23,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/order_successful');
                    },
                    child: Container(
                      height: 52,
                      width: 153,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9644).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
