import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/product_provider.dart';
import 'package:frontend/screens/student/item_window.dart';
import 'package:frontend/screens/page_route/hero_dialog_route.dart';
import 'package:frontend/shared/cart_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants.dart';
import '../../providers/cart_provider.dart';
import '../../shared/back_button_container.dart';
import '../../shared/cart_container.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    final double _ = MediaQuery.sizeOf(context).width;
    final double _ = MediaQuery.sizeOf(context).height;

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
        actions: [CartButton(productQuantity: cartProducts.length)],
      ),
      body: Stack(
        children: [
          products.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (product) {
              if (product.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "No products to show",
                        style: kFlameFontTitle,
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  Center(
                    child: Text(
                      "${product[0].stallName}'s Menu",
                      style: const TextStyle(fontSize: 30, fontFamily: "flame"),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 100,
                      ),
                      child: GridView.builder(
                        itemCount: product.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final String publicUrl = Supabase.instance.client.storage
                              .from("images")
                              .getPublicUrl(
                                "${product[index].photoPath}",
                              );
                          return GestureDetector(
                            onTap: () {
                              if (product[index].productStatus) {
                                Navigator.of(context).push(
                                  HeroDialogRoute(
                                    builder: (context) {
                                      return ItemWindow(
                                        productID: product[index].productID,
                                        unitPrice:
                                            product[index].productPrice,
                                        index: index,
                                        publicUrl: publicUrl,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            child: Hero(
                              tag: "$itemTag-$index",
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE591),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (!product[index].productStatus)
                                      Text(
                                        "Unavailable",
                                        style: kFlameFontTitle.copyWith(
                                          fontSize: 24,
                                        ),
                                      ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(
                                            0xFFFF9644,
                                          ).withValues(alpha: 0.50),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        width: double.infinity,
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Image.network(
                                            publicUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      product[index].productName!,
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: "flame",
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${product[index].productPrice} PHP",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: "flame",
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(bottom: 0, child: CartContainer()),
        ],
      ),
    );
  }
}
