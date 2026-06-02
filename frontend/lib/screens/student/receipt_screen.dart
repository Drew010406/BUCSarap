import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/providers/receipt_provider.dart';
import '../../shared/back_button_container.dart';

class ReceiptScreen extends ConsumerWidget {
  const ReceiptScreen({super.key});

  void _showReceiptDetails(BuildContext context, WidgetRef ref, File file) async {
    final content = await ref.read(receiptProvider.notifier).getReceiptContent(file);
    
    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration:  BoxDecoration(
          color: Color(0xFFEFE2D3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding:  EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Receipt Details",
                  style: kFlameFontTitle.copyWith(fontSize: 22),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
             Divider(color: Colors.black26),
             SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style:  TextStyle(
                    fontFamily: 'Flame',
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ),
             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptsAsync = ref.watch(receiptProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor:  Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: receiptsAsync.when(
        data: (files) {
          if (files.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(height: 16),
                  Text(
                    "No receipts found",
                    style: kFlameDescription.copyWith(color: Colors.black45),
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "My Receipts",
                style: kFlameFontTitle.copyWith(fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                  padding:  EdgeInsets.all(16),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];
                    final fileName = file.path.split(Platform.pathSeparator).last;
                    final dateString = fileName.replaceAll('.txt', '');

                    return Card(
                      margin:  EdgeInsets.only(bottom: 12),
                      color: Color(0xFFFFC570),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        title: Text(
                          "Receipt: $dateString",
                          style: kFlameFontTitle.copyWith(fontSize: 16),
                        ),
                        subtitle: Text(
                          "Created: ${file.lastModifiedSync().toString().split('.')[0]}",
                          style: kFlameDescription.copyWith(fontSize: 12, color: Colors.black45),
                        ),
                        trailing:  Icon(Icons.chevron_right),
                        onTap: () => _showReceiptDetails(context, ref, file),
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title:  Text("Delete Receipt?"),
                              content:  Text("Are you sure you want to delete this receipt?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child:  Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref.read(receiptProvider.notifier).deleteReceipt(file);
                                    Navigator.pop(context);
                                  },
                                  child:  Text("Delete", style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error loading receipts: $err")),
      ),
    );
  }
}
