import 'package:flutter/material.dart';
import 'package:frontend/components/stall_holder/navigation_panel.dart';
import 'package:frontend/constants.dart';

import '../../shared/back_button_container.dart';

class StallHolderScreen extends StatefulWidget {
  const StallHolderScreen({super.key});

  @override
  State<StallHolderScreen> createState() => _StallHolderScreenState();
}

class _StallHolderScreenState extends State<StallHolderScreen> {
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
            Navigator.popUntil(context, ModalRoute.withName('/'));
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(75),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Stall Name',
                    style: kJetbrainsFontTitle.copyWith(fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' # ',
                        style: TextStyle(color: Colors.black45),
                      ),
                      TextSpan(
                        text: 'Stall ID',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text(
                  "# Owner ID",
                  style: kJetbrainsDescription.copyWith(color: Colors.black45),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Opening time: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Opening time',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Closing time: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Closing time',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Operating Days: ',
                    style: kJetbrainsDescription.copyWith(
                      decoration: TextDecoration.none,
                      color: kPrimaryColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Operating Days',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF9644).withValues(alpha: 0.50),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(width: 2, color: Color(0xFFDA782B)),
                    ),
                    child: Center(
                      child: Text(
                        "Active",
                        style: kJetbrainsFontTitle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Home, Queue, Processed History, Analytics?
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
