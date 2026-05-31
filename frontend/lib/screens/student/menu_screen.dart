import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/product_provider.dart';
import 'package:frontend/screens/student/item_window.dart';
import 'package:frontend/screens/page_route/hero_dialog_route.dart';
import 'package:frontend/shared/cart_button.dart';

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

    final double _ = MediaQuery
        .sizeOf(context)
        .width;
    final double _ = MediaQuery
        .sizeOf(context)
        .height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
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
          if(products.value!.isNotEmpty)
            Column(
              children: [
                Center(
                  child: Text(
                    "${products.value?[0].stallName}'s Menu",
                    style: TextStyle(fontSize: 30, fontFamily: "flame"),
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
                    child: products.when(
                      loading: () =>
                      const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text('Error: $err'),
                      data: (product) {
                        return GridView.builder(
                          itemCount: product.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.78,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                if (product[index].productStatus) {
                                  Navigator.of(context).push(
                                    HeroDialogRoute(
                                      builder: (context) {
                                        return ItemWindow(
                                          productID: product[index].productID,
                                          unitPrice: product[index]
                                              .productPrice,
                                          index: index,
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Hero(
                                tag: "$itemTag-$index",
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFE591),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if(!product[index].productStatus)
                                        Text("Unavailable",
                                          style: kJetbrainsFontTitle.copyWith(
                                              fontSize: 24),),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0xFFFF9644,
                                            ).withValues(alpha: 0.50),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          // padding: EdgeInsets.all(1),
                                          width: double.infinity,
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset(
                                              "images/foods/beef_steak.jpg",
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
                                      SizedBox(height: 10),
                                      Text(
                                        "${product[index].productPrice} PHP",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: "flame",
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          else
            Column(children: [
              Center(child: Text(
                "No products to show", style: kJetbrainsFontTitle,),)
            ],),
          Positioned(bottom: 0, child: CartContainer()),
        ],
      ),
    );
  }
}
