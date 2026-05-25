import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class AddNameModal extends StatelessWidget {
  const AddNameModal({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              decoration: BoxDecoration(
                color: Color(0xFFFFC570).withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Name (Optional)",
                    style: kJetbrainsFontTitle.copyWith(fontSize: 24),
                  ),
                  TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.black, fontFamily: "Flame"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.brown,
                          width: 0.0,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.black45),
                      hintText: 'Add name',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFDA782B).withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Add Name",
                                style: kJetbrainsLoginRegister,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFDA782B),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Stay Anonymous",
                                style: kJetbrainsLoginRegister,
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
          ],
        ),
      ),
    );
  }
}
