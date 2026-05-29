import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../shared/back_button_container.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('Category Name', style: kJetbrainsFontTitle.copyWith(fontSize: 24)),
            SizedBox(height: 20,),
            TextField(
              style: TextStyle(color: Colors.black, fontFamily: "Flame"),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.brown, width: 0.0),
                ),
                hintStyle: TextStyle(color: Colors.black45),
                hintText: 'Category name',
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/stall_holder_screen');
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFDA782B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Add Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Flame", color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
