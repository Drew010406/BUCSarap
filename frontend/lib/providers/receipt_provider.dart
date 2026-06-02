import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receipt_provider.g.dart';

@riverpod
class ReceiptNotifier extends _$ReceiptNotifier {
  @override
  Future<List<File>> build() async {
    return _loadReceipts();
  }

  Future<List<File>> _loadReceipts() async {
    final directory = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> files = directory.listSync();
    return files
        .whereType<File>()
        .where((file) => file.path.endsWith('.txt'))
        .toList()
      ..sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadReceipts());
  }

  Future<String> getReceiptContent(File file) async {
    return await file.readAsString();
  }

  Future<void> deleteReceipt(File file) async {
    if (await file.exists()) {
      await file.delete();
      await refresh();
    }
  }
}
