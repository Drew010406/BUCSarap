import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/product_provider.dart';
import 'package:frontend/providers/stall_provider.dart';

import '../../constants.dart';
import '../../providers/cart_provider.dart';
import '../../shared/back_button_container.dart';
import '../../shared/cart_button.dart';
import '../../shared/cart_container.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final stallWithCategory = ref.watch(stallsWithCategoriesProvider);
    final double _ = MediaQuery.sizeOf(context).width;
    final double _ = MediaQuery.sizeOf(context).height;

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
          Column(
            children: [
              Center(
                child: Text(
                  "Product Categories",
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
                  child: stallWithCategory.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Text('Error: $err'),
                    data: (data) {
                      final stallCategories = data.categories;
                      return GridView.builder(
                        itemCount: stallCategories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(selectedCategoryProvider.notifier)
                                  .selectedCategory(stallCategories[index]);
                              final products = ref.watch(productsProvider);
                              Navigator.pushNamed(context, '/menu_screen');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE591),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    stallCategories[index].categoryName ??
                                        "No name",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: "flame",
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
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
          ),
          Positioned(bottom: 0, child: CartContainer()),
        ],
      ),
    );
  }
}
