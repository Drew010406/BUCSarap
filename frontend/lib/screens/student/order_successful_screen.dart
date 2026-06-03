import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 270),
              padding: EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                color: Color(0xFFFFC570),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox()),

                  Text(
                    "Order is now placed!",
                    style: kFlameFontTitle.copyWith(fontSize: 30),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Please confirm your order on-site for it to be processed, thank you!",
                    textAlign: TextAlign.center,
                    style: kFlameDescription.copyWith(color: Colors.brown),
                  ),

                  Expanded(child: SizedBox()),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName('/stall_selection'),
                      );
                    },
                    child: Container(
                      height: 42,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9644).withValues(alpha: 0.50),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(width: 2, color: Color(0xFFDA782B)),
                      ),
                      child: Center(
                        child: Text(
                          "Home",
                          style: TextStyle(fontFamily: 'Flame'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
