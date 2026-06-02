import 'package:eventflux/client.dart';
import 'package:eventflux/enum.dart';
import 'package:eventflux/models/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/components/stall_holder/navigation_panel.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/main.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/queue_provider.dart';
import 'package:frontend/screens/stall_holder/order_details_modal.dart';
import 'package:frontend/screens/stall_holder/preparing_item_details_modal.dart';
import 'package:frontend/screens/stall_holder/queue_item_details_modal.dart';

import '../../providers/owner_stall_provider.dart';
import '../../shared/back_button_container.dart';
import '../custom_delegate/custom_delegate.dart';
import '../page_route/hero_dialog_route.dart';

enum Status { PENDING, PROCESSING }

class QueueScreen extends ConsumerStatefulWidget {
  const QueueScreen({super.key});

  @override
  ConsumerState<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends ConsumerState<QueueScreen> {
  Status _status = Status.PENDING;
  final Color inactive = Color(0xFFFFC570).withValues(alpha: 0.8);
  final Color active = Color(0xFFDA782B);

  void _updateStatus(Status status) {
    _status = status;
  }

  @override
  Widget build(BuildContext context) {
    final stallData = ref.read(ownerStallProvider).value;
    final pendingQueue = ref.watch(pendingQueueProviderProvider);
    final preparingQueue = ref.watch(preparingQueueProviderProvider);

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
        actions: [
          IconButton(
            color: Color(0xFFDA782B),
            icon: const Icon(Icons.search),
            onPressed: () async {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  data: (_status == Status.PENDING)
                      ? pendingQueue.value
                      : preparingQueue.value,
                  onItemTap: (ctx, item) async {
                    final orderService = ref.read(orderServiceProvider);
                    final orderDetails = await orderService.getOrderDetails(
                      item.orderID!,
                      stallData!.stallID!,
                    );
                    Navigator.of(ctx).push(
                      HeroDialogRoute(
                        builder: (_) => QueueItemDetailsModal(
                          index: item.orderID,
                          orderDetails: orderDetails,
                          orderID: item.orderID,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xFFEFE2D3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _updateStatus(Status.PENDING);
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: _status == Status.PENDING ? active : inactive,
                    ),
                    child: Center(
                      child: Text(
                        "Pending",
                        style: TextStyle(fontFamily: "Flame"),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _updateStatus(Status.PROCESSING);
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      color: _status == Status.PROCESSING ? active : inactive,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Processing",
                        style: TextStyle(fontFamily: "Flame"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          if (_status == Status.PENDING)
            Expanded(
              child: pendingQueue.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text(
                    "No pending items to show",
                    style: kFlameFontTitle.copyWith(fontSize: 24),
                  ),
                ),
                data: (items) {
                  return GridView.builder(
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final currentItem = items[index];
                      return GestureDetector(
                        onTap: () async {
                          final orderService = ref.read(orderServiceProvider);
                          final orderDetails = await orderService
                              .getOrderDetails(
                                items[index].orderID!,
                                stallData!.stallID!,
                              );
                          setState(() {
                            Navigator.of(context).push(
                              HeroDialogRoute(
                                builder: (context) {
                                  return QueueItemDetailsModal(
                                    index: index,
                                    orderDetails: orderDetails,
                                    orderID: items[index].orderID,
                                  );
                                },
                              ),
                            );
                          });
                        },
                        child: Hero(
                          tag: "$queueTag-$index",
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFC570),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: SizedBox()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${currentItem.customerName}",
                                      style: kFlameFontTitle.copyWith(
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "${currentItem.orderNumber}",
                                      style: kFlameDescription.copyWith(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                GestureDetector(
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xFFDA782B,
                                      ).withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Accept",
                                        style: kJetbrainsLoginRegister,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDA782B),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Decline",
                                        style: kJetbrainsLoginRegister,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          else
            Expanded(
              child: preparingQueue.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text(
                    "No preparing items to show",
                    style: kFlameFontTitle.copyWith(fontSize: 24),
                  ),
                ),
                data: (items) {
                  return GridView.builder(
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final currentItem = items[index];
                      return GestureDetector(
                        onTap: () async {
                          final orderService = ref.read(orderServiceProvider);
                          final orderDetails = await orderService
                              .getOrderDetails(
                                items[index].orderID!,
                                stallData!.stallID!,
                              );
                          setState(() {
                            Navigator.of(context).push(
                              HeroDialogRoute(
                                builder: (context) {
                                  return PreparingItemDetailsModal(
                                    index: index,
                                    orderDetails: orderDetails,
                                    orderID: items[index].orderID,
                                  );
                                },
                              ),
                            );
                          });
                        },
                        child: Hero(
                          tag: "$queueTag-$index",
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFC570),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: SizedBox()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${currentItem.customerName}",
                                      style: kFlameFontTitle.copyWith(
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "${currentItem.orderNumber}",
                                      style: kFlameDescription.copyWith(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    child: Container(
                                      width: 80,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xFFDA782B,
                                        ).withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Complete",
                                          style: kJetbrainsLoginRegister,
                                        ),
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
