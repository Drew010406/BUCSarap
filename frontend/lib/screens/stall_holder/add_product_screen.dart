import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/providers/owner_stall_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/product_model.dart';
import '../../shared/back_button_container.dart';

File? _pickedImageFile;

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final ImagePicker _picker = ImagePicker();
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  File? galleryFile;
  double _alignmentX = 0.0;
  double _alignmentY = 0.0;
  String imagePath = '';

  // Na-cow
  Future<void> _saveImage(File file, String fileName) async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String directoryPath = '${appDocDir.path}/images/foods';
      final Directory targetDir = Directory(directoryPath);

      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }

      final String filePath = '$directoryPath/$fileName';
      await file.copy(filePath);

      setState(() {
        imagePath = filePath;
      });
      
      print('Image saved to: $filePath');
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  // https://www.geeksforgeeks.org/flutter/gallery-access-in-flutter/
  Future getImage(ImageSource img) async {
    // pick image from gallary
    final pickedFile = await _picker.pickImage(source: img);
    // store it in a valid variable
    XFile? xfilePick = pickedFile;
    if (xfilePick != null) {
      final File file = File(pickedFile!.path);
      setState(() {
        // store that in global variable galleryFile in the form of File
        galleryFile = file;
        _alignmentX = 0.0;
        _alignmentY = 0.0;
      });
      await _saveImage(file, pickedFile.name);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Nothing is selected')));
      }
    }
  }

  void _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
            Text(
              'Product Image',
              style: kJetbrainsFontTitle.copyWith(fontSize: 24),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showPicker(context: context);
              },
              onPanUpdate: galleryFile != null
                  ? (details) {
                      setState(() {
                        _alignmentX = (_alignmentX - details.delta.dx / 150)
                            .clamp(-1.0, 1.0);
                        _alignmentY = (_alignmentY - details.delta.dy / 150)
                            .clamp(-1.0, 1.0);
                      });
                    }
                  : null,
              child: Container(
                height: 200,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFFDBD10).withValues(alpha: 0.50),
                ),
                child: galleryFile != null
                    ? Image.file(
                        galleryFile!,
                        fit: BoxFit.cover,
                        alignment: Alignment(_alignmentX, _alignmentY),
                      )
                    : const Center(
                        child: Text(
                          'Add a photo',
                          style: TextStyle(fontFamily: 'Flame'),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Product Name',
              style: kJetbrainsFontTitle.copyWith(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: productNameController,
              style: TextStyle(color: Colors.black, fontFamily: "Flame"),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.brown, width: 0.0),
                ),
                hintStyle: TextStyle(color: Colors.black45),
                hintText: 'Product name',
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Product Price',
              style: kJetbrainsFontTitle.copyWith(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: productPriceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              style: TextStyle(color: Colors.black, fontFamily: "Flame"),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.brown, width: 0.0),
                ),
                hintStyle: TextStyle(color: Colors.black45),
                hintText: 'Product Price in PHP',
              ),
            ),
            Expanded(child: SizedBox(height: double.infinity)),
            GestureDetector(
              onTap: () async {
                await ref
                    .read(ownerStallProductsByCategoryProviderProvider.notifier)
                    .addProduct(ProductCreateModel(
                  productName: productNameController.text,
                  productPrice: double.parse(productPriceController.text),
                  photoPath: imagePath,
                  productStatus: false
                ));
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
                    'Add Product',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Flame", color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
