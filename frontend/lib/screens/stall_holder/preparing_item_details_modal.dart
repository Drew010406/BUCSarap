import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/order_details_model.dart';
import 'package:frontend/providers/owner_stall_provider.dart';
import 'package:frontend/providers/queue_provider.dart';

import '../../constants.dart';

class PreparingItemDetailsModal extends ConsumerStatefulWidget {
  final int? index;
  final OrderDetailsModel? orderDetails;
  final int? orderID;
  const PreparingItemDetailsModal({super.key, required this.index, this.orderDetails, this.orderID});

  @override
  ConsumerState<PreparingItemDetailsModal> createState() => _QueueItemDetailsModalState();
}

class _QueueItemDetailsModalState extends ConsumerState<PreparingItemDetailsModal> {
  @override
  Widget build(BuildContext context) {
    final items = widget.orderDetails!.items ?? [];
    final queueService = ref.watch(pendingQueueProviderProvider.notifier);
    final currentStall = ref.watch(ownerStallProvider).value;

    return Center(
      child: Hero(
        tag: "$queueTag-${widget.index}",
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 240),
          child: Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFFFC570),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Order Details",
                    style: kJetbrainsFontTitle.copyWith(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    text: 'Customer Name: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.orderDetails!.customerName}',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Order No.: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.orderDetails!.orderNumber}',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Order Status: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.orderDetails!.orderStatus}',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Order Time: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.orderDetails!.orderTime}',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Total Cost: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.orderDetails!.totalCost}',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  "Items:",
                  style: kJetbrainsDescription.copyWith(
                    decoration: TextDecoration.none,
                    color: kPrimaryColor,
                    fontSize: 19,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Product Name",
                      style: kJetbrainsDescription.copyWith(
                        decoration: TextDecoration.none,
                        color: kPrimaryColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Quantity",
                      style: kJetbrainsDescription.copyWith(
                        decoration: TextDecoration.none,
                        color: kPrimaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${items[index].productName}",
                              style: kJetbrainsDescription.copyWith(
                                decoration: TextDecoration.none,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            child: Text(
                              "x ${items[index].quantityOrdered}",
                              style: kJetbrainsDescription.copyWith(
                                decoration: TextDecoration.none,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final response = await queueService.acceptOrder(widget.orderID!, currentStall!.stallID!);
                          if (!mounted) return;
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFDA782B).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Mark as complete",
                              style: kJetbrainsLoginRegister.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       final response = await queueService.declineOrder(widget.orderID!, currentStall!.stallID!);
                    //       if (!mounted) return;
                    //       Navigator.pop(context);
                    //     },
                    //     child: Container(
                    //       width: 80,
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //         color: Color(0xFFDA782B),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Center(
                    //         child: Text(
                    //           "Decline",
                    //           style: kJetbrainsLoginRegister.copyWith(
                    //             decoration: TextDecoration.none,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
