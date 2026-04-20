import 'package:flutter/material.dart';

import '../../shared/back_button_container.dart';
import '../../shared/cart_button.dart';

class StallHolderScreen extends StatefulWidget {
  const StallHolderScreen({super.key});

  @override
  State<StallHolderScreen> createState() => _StallHolderScreenState();
}

class _StallHolderScreenState extends State<StallHolderScreen> {
  @override
  Widget build(BuildContext context) {
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
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDBD10).withValues(alpha: 0.50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(flex: 2,child: Container(decoration: BoxDecoration())),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEC1C24),
                                      // border: Border.all(
                                      //   width: 2,
                                      //   color: Color(0xFFB67C4F),
                                      // ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFED7902),
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xFFDA782B),
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sold out',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // Home, Queue, Processed History, Analytics?
          Container(
            height: 100,
            decoration: BoxDecoration(color: Color(0xFFFF9644)),
            child: Row(
              children: [
                // TODO: Create a separate class for this to reduce repetition
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(children: [Icon(Icons.home), Text("Home")]),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [Icon(Icons.queue), Text("Queue")],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [Icon(Icons.analytics), Text("Analytics")],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [Icon(Icons.history), Text("History")],
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
  }
}
