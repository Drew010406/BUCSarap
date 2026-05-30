import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';

import '../../providers/owner_stall_provider.dart';

class EditCategoryModal extends ConsumerWidget {
  final int? index;
  final nameController = TextEditingController();

  EditCategoryModal({super.key, this.index});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Hero(
        tag: "$editTag-$index",
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 240),
          child: Material(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text('Edit Category Name', style: kJetbrainsFontTitle.copyWith(fontSize: 24)),
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
                      await ref.read(ownerStallCategoryProviderProvider.notifier).renameCategory(nameController.text);
                      Navigator.pop(context);
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
          ),
        ),
      ),
    );
  }
}
