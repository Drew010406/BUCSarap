import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class OrderDetailsModal extends StatelessWidget {
  final int? index;

  const OrderDetailsModal({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "$itemTag-$index}",
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 50, vertical: 240),
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
                        text: 'Customer Name',
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
                        text: 'Order Number',
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
                        text: 'Pending',
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
                        text: 'Order Time',
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
                        text: 'Cost',
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
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Product Name",
                              style: kJetbrainsDescription.copyWith(
                                decoration: TextDecoration.none,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            child: Text(
                              "x 10",
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
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFDA782B).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Accept",
                              style: kJetbrainsLoginRegister.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
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
                              style: kJetbrainsLoginRegister.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
