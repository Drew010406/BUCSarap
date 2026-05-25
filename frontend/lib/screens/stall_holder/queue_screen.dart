import 'package:flutter/material.dart';
import 'package:frontend/components/stall_holder/navigation_panel.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/main.dart';

import '../../shared/back_button_container.dart';

enum Status { PENDING, PROCESSING }

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  Status _status = Status.PENDING;

  final Color inactive = Color(0xFFFFC570).withValues(alpha: 0.8);
  final Color active = Color(0xFFDA782B);

  void _updateStatus(Status status) {
    _status = status;
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

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
                      ),                    ),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFFFFC570),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: SizedBox(),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Customer Name", style: kJetbrainsFontTitle.copyWith(fontSize: 17),),
                    Text("Order Number", style: kJetbrainsDescription.copyWith(color: Colors.black45),)
                  ],
                ),
                Expanded(child: SizedBox(),),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFDA782B).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Accept", style: kJetbrainsLoginRegister,)),
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFDA782B),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Decline", style: kJetbrainsLoginRegister,)),
                  ),
                )
              ],
            ),
          ),
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
