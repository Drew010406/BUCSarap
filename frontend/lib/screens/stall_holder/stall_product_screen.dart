import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/providers/owner_stall_provider.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../shared/back_button_container.dart';

class StallProductScreen extends ConsumerStatefulWidget {
  const StallProductScreen({super.key});

  @override
  ConsumerState<StallProductScreen> createState() => _StallProductScreenState();
}

class _StallProductScreenState extends ConsumerState<StallProductScreen> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final stallProducts = ref.watch(
      ownerStallProductsByCategoryProviderProvider,
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/stall_category'));
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
          Text("Stall Products", style: kJetbrainsFontTitle),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 0,
                bottom: 0,
              ),
              child: stallProducts.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text("Error: $err"),
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
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE591),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${data[index].productName}",
                              style: kJetbrainsFontTitle.copyWith(fontSize: 24),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(decoration: BoxDecoration()),
                            ),
                            SizedBox(
                              height: 90,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        await ref
                                            .read(
                                              ownerStallProductsByCategoryProviderProvider
                                                  .notifier,
                                            )
                                            .deleteProduct(
                                              data[index].productID!,
                                            );
                                      },
                                      child: Container(
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
                                            'Remove',
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
                                  SizedBox(height: 2),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        await ref
                                            .read(
                                              ownerStallProductsByCategoryProviderProvider
                                                  .notifier,
                                            )
                                            .toggleProductStatus(
                                              data[index].productID!,
                                            );
                                      },
                                      child: Container(
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xFFFF9644,
                                          ).withValues(alpha: 0.50),
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFDA782B),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            data[index].productStatus
                                                ? "Mark as Unavailable"
                                                : "Mark as Available",
                                            style: TextStyle(
                                              color: Color(0xFF7A3D00),
                                              fontFamily: 'Flame',
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
