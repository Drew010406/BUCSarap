import 'package:flutter/material.dart';

import '../../shared/back_button_container.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

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
        child: ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFDBD10).withValues(alpha: 0.50),
                ),
                child: Center(
                  child: Text('Add a photo'),
                ),
              ),
              Text('Product Name'),
              TextField(
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
                  hintText: 'Product name',
                ),
              ),
              Text('Product Price'),
              TextField(
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
                  hintText: 'Product Price in PHP',
                ),
              ),
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
                      'Add Product',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Flame",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
        ]),
      ),
    );
  }
}
