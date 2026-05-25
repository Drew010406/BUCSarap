import 'package:flutter/material.dart';

import '../../components/stall_holder/navigation_panel.dart';
import '../../constants.dart';
import '../../shared/back_button_container.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
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
            Navigator.popUntil(context, ModalRoute.withName('/stall_holder_screen'));
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
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFDA782B).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("View Details", style: kJetbrainsLoginRegister,)),
                  ),
                ),
                SizedBox(width: 10,),

              ],
            ),
          ),
          NavigationPanel(currentRoute: currentRoute as String,),
        ],
      ),
    );
  }
}
