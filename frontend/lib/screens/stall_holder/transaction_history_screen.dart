import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/transaction_history_provider.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../constants.dart';
import '../../shared/back_button_container.dart';
import '../page_route/hero_dialog_route.dart';
import 'order_details_modal.dart';

class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  ConsumerState<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState
    extends ConsumerState<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final transactionHistory = ref.watch(transactionHistoryProviderProvider(1));

    final currentRoute = ModalRoute.of(context)?.settings.name;
    double cellWidth = ((MediaQuery.of(context).size.width - 50) / 2);
    double desiredCellHeight = 35;
    double childAspectRatio = cellWidth / desiredCellHeight;

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
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/add_product_screen');
        //     },
        //     icon: Icon(Icons.add, color: Color(0xFFDA782B)),
        //   ),
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Text(
              "Transaction History",
              style: kJetbrainsFontTitle.copyWith(fontSize: 30),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: transactionHistory.when(
              loading: () => const Center(child: CircularProgressIndicator(),),
              error: (err, stack) => Text("Error: $err"),
              data: (data) {
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          HeroDialogRoute(
                            builder: (context) {
                              return OrderDetailsModal(index: index);
                            },
                          ),
                        );
                      },
                      child: Hero(
                        tag: "$transactTag-$index",
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFC570),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: SizedBox()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${data[index].customerName}",
                                    style: kJetbrainsFontTitle.copyWith(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "${data[index].orderNumber}",
                                    style: kJetbrainsDescription.copyWith(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              GestureDetector(
                                child: Container(
                                  width: 110,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xFFDA782B,
                                    ).withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View Details",
                                      style: kJetbrainsLoginRegister,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
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
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
