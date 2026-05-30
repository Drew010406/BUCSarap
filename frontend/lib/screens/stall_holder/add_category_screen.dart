import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/owner_stall_provider.dart';

import '../../constants.dart';
import '../../shared/back_button_container.dart';

class AddCategoryScreen extends ConsumerStatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  ConsumerState<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends ConsumerState<AddCategoryScreen> {
  final nameController = TextEditingController();

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
              controller: nameController,
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
              onTap: () async {
                await ref.read(ownerStallCategoryProviderProvider.notifier).addNewCategory(nameController.text);
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
