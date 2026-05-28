import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/owner_provider.dart';
import 'package:frontend/providers/owner_stall_provider.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../constants.dart';
import '../../shared/back_button_container.dart';

class StallCategoryScreen extends ConsumerStatefulWidget {
  const StallCategoryScreen({super.key});

  @override
  ConsumerState<StallCategoryScreen> createState() =>
      _StallCategoryScreenState();
}

class _StallCategoryScreenState extends ConsumerState<StallCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final currentOwner = ref.watch(ownerNotifierProvider);
    final categories = ref.watch(
      ownerStallCategoryProviderProvider(currentOwner!, 2),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName('/stall_holder_screen'),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_product_screen');
            },
            icon: Icon(Icons.add, color: Color(0xFFDA782B)),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 0,
                bottom: 0,
              ),
              child: categories.when(
                loading: () => const Center(child: CircularProgressIndicator(),),
                error: (err, stack) => Text('Error: $err'),
                data: (data) {
                  return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // ref.read(ownerStallCategoryProviderProvider.notifier).selectedCategory(data[index]);
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
                              data[index].categoryName ?? "No name",
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
                );},
              ),
            ),
          ),
          // Home, Queue, Processed History, Analytics?
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
