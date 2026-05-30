import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/owner_provider.dart';
import 'package:frontend/providers/owner_stall_provider.dart';
import 'package:frontend/screens/stall_holder/edit_category_modal.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../constants.dart';
import '../../shared/back_button_container.dart';
import '../page_route/hero_dialog_route.dart';

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
    final categories = ref.watch(ownerStallCategoryProviderProvider);
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
              Navigator.pushNamed(context, '/add_category');
            },
            icon: Icon(Icons.add, color: Color(0xFFDA782B)),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Stall Category", style: kJetbrainsFontTitle),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 0,
                bottom: 0,
              ),
              child: categories.when(
                loading: () => const Center(child: CircularProgressIndicator()),
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
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE591),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(currentCategoryProvider.notifier)
                                      .categoryID = data[index]
                                      .categoryID!;
                                  Navigator.pushNamed(
                                    context,
                                    '/stall_product',
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFC570).withValues(alpha: 0.8),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text(
                                      data[index].categoryName ?? "No name",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: "flame",
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                        .read(currentCategoryProvider.notifier)
                                        .categoryID =
                                    data[index].categoryID!;
                                Navigator.of(context).push(
                                  HeroDialogRoute(
                                    builder: (context) {
                                      return EditCategoryModal(index: index);
                                    },
                                  ),
                                );
                              },
                              child: Hero(
                                tag: "$editTag-$index",
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xFFEC1C24,
                                    ).withValues(alpha: 0.8),
                                    borderRadius: BorderRadius.circular(
                                      22,
                                    ), // rect feels more native than pill
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Flame',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  );
                },
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
