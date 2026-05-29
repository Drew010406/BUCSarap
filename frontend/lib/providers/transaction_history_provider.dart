import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/revenue_model.dart';
import 'package:frontend/models/transaction_history_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:frontend/services/history/history_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'transaction_history_provider.g.dart';

@riverpod
class TransactionHistoryProvider extends _$TransactionHistoryProvider {

  @override
  Future<List<TransactionHistoryModel>> build(int stallID) async {
    final historyService = ref.watch(historyServiceProvider);
    final response = await historyService.getStallHistory(stallID);
    return (response as List).map((item) => TransactionHistoryModel.fromJson(item)).toList();
  }
}

@riverpod
class MonthlyRevenue extends _$MonthlyRevenue {
  @override
  Future<RevenueModel> build() async {
    throw UnimplementedError();
  }
}

@riverpod
class WeeklyRevenue extends _$WeeklyRevenue {
  @override
  Future<RevenueModel> build() async {
    throw UnimplementedError();
  }
}

@riverpod
class DailyRevenue extends _$DailyRevenue {
  @override
  Future<RevenueModel> build() async {
    throw UnimplementedError();
  }
}

final historyServiceProvider = Provider<HistoryService>((ref) {
  final dio = ref.watch(dioProvider);
  return HistoryService(dio: dio);
});