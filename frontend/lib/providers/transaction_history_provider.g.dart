// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionHistoryProvider)
final transactionHistoryProviderProvider =
    TransactionHistoryProviderProvider._();

final class TransactionHistoryProviderProvider
    extends
        $AsyncNotifierProvider<
          TransactionHistoryProvider,
          List<TransactionHistoryModel>
        > {
  TransactionHistoryProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionHistoryProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionHistoryProviderHash();

  @$internal
  @override
  TransactionHistoryProvider create() => TransactionHistoryProvider();
}

String _$transactionHistoryProviderHash() =>
    r'dfbfb1dc536f333fd4a0f3c310234df2ce43a4d4';

abstract class _$TransactionHistoryProvider
    extends $AsyncNotifier<List<TransactionHistoryModel>> {
  FutureOr<List<TransactionHistoryModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TransactionHistoryModel>>,
              List<TransactionHistoryModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TransactionHistoryModel>>,
                List<TransactionHistoryModel>
              >,
              AsyncValue<List<TransactionHistoryModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(MonthlyRevenue)
final monthlyRevenueProvider = MonthlyRevenueProvider._();

final class MonthlyRevenueProvider
    extends $AsyncNotifierProvider<MonthlyRevenue, RevenueModel> {
  MonthlyRevenueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyRevenueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyRevenueHash();

  @$internal
  @override
  MonthlyRevenue create() => MonthlyRevenue();
}

String _$monthlyRevenueHash() => r'6d0dd23d7ee870269309e4c90d5fe87b6989b131';

abstract class _$MonthlyRevenue extends $AsyncNotifier<RevenueModel> {
  FutureOr<RevenueModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RevenueModel>, RevenueModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueModel>, RevenueModel>,
              AsyncValue<RevenueModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(WeeklyRevenue)
final weeklyRevenueProvider = WeeklyRevenueProvider._();

final class WeeklyRevenueProvider
    extends $AsyncNotifierProvider<WeeklyRevenue, RevenueModel> {
  WeeklyRevenueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weeklyRevenueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weeklyRevenueHash();

  @$internal
  @override
  WeeklyRevenue create() => WeeklyRevenue();
}

String _$weeklyRevenueHash() => r'0fff192f0c8e43b068ebebbd789dd6f5b73b7d89';

abstract class _$WeeklyRevenue extends $AsyncNotifier<RevenueModel> {
  FutureOr<RevenueModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RevenueModel>, RevenueModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueModel>, RevenueModel>,
              AsyncValue<RevenueModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DailyRevenue)
final dailyRevenueProvider = DailyRevenueProvider._();

final class DailyRevenueProvider
    extends $AsyncNotifierProvider<DailyRevenue, RevenueModel> {
  DailyRevenueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyRevenueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyRevenueHash();

  @$internal
  @override
  DailyRevenue create() => DailyRevenue();
}

String _$dailyRevenueHash() => r'59859b932feb36028850cfb876705a1e106ada25';

abstract class _$DailyRevenue extends $AsyncNotifier<RevenueModel> {
  FutureOr<RevenueModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RevenueModel>, RevenueModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueModel>, RevenueModel>,
              AsyncValue<RevenueModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
