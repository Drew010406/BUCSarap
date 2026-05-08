import 'dart:io';

class WriteReceipts {
  static Future<void> writeReceipt(String receiptNumber, Map<String, dynamic> orders) async {
    /// Plan? use the receiptNumber as the file name and convert that file into img
    final File file = File("$receiptNumber.txt");

  }
}