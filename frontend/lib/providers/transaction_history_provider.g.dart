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
    r'e40d5a929818c40ed5eb7040d8edee8ee757db84';

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

String _$weeklyRevenueHash() => r'f4d0c8fb8e726d54d7a751e2ec855065adf6a9ab';

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

@ProviderFor(DailyComparison)
final dailyComparisonProvider = DailyComparisonProvider._();

final class DailyComparisonProvider
    extends $AsyncNotifierProvider<DailyComparison, RevenueComparison> {
  DailyComparisonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyComparisonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyComparisonHash();

  @$internal
  @override
  DailyComparison create() => DailyComparison();
}

String _$dailyComparisonHash() => r'08599b2abebd0d583b08c4bfa1ffe02d83e29aec';

abstract class _$DailyComparison extends $AsyncNotifier<RevenueComparison> {
  FutureOr<RevenueComparison> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RevenueComparison>, RevenueComparison>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueComparison>, RevenueComparison>,
              AsyncValue<RevenueComparison>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(WeeklyComparison)
final weeklyComparisonProvider = WeeklyComparisonProvider._();

final class WeeklyComparisonProvider
    extends $AsyncNotifierProvider<WeeklyComparison, RevenueComparison> {
  WeeklyComparisonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weeklyComparisonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weeklyComparisonHash();

  @$internal
  @override
  WeeklyComparison create() => WeeklyComparison();
}

String _$weeklyComparisonHash() => r'7abe193ac6ba08f3a7151c70b2ea47e767a3f887';

abstract class _$WeeklyComparison extends $AsyncNotifier<RevenueComparison> {
  FutureOr<RevenueComparison> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RevenueComparison>, RevenueComparison>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueComparison>, RevenueComparison>,
              AsyncValue<RevenueComparison>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(MonthlyComparison)
final monthlyComparisonProvider = MonthlyComparisonProvider._();

final class MonthlyComparisonProvider
    extends $AsyncNotifierProvider<MonthlyComparison, RevenueComparison> {
  MonthlyComparisonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyComparisonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyComparisonHash();

  @$internal
  @override
  MonthlyComparison create() => MonthlyComparison();
}

String _$monthlyComparisonHash() => r'668148c8870265c918f001d1656a8b248c1d9396';

abstract class _$MonthlyComparison extends $AsyncNotifier<RevenueComparison> {
  FutureOr<RevenueComparison> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RevenueComparison>, RevenueComparison>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RevenueComparison>, RevenueComparison>,
              AsyncValue<RevenueComparison>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(TenDaysRevenue)
final tenDaysRevenueProvider = TenDaysRevenueProvider._();

final class TenDaysRevenueProvider
    extends $AsyncNotifierProvider<TenDaysRevenue, List<LastTenDaysRevenue>> {
  TenDaysRevenueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tenDaysRevenueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tenDaysRevenueHash();

  @$internal
  @override
  TenDaysRevenue create() => TenDaysRevenue();
}

String _$tenDaysRevenueHash() => r'ab8ab6461146220025a122f4b7c936de18603fcd';

abstract class _$TenDaysRevenue
    extends $AsyncNotifier<List<LastTenDaysRevenue>> {
  FutureOr<List<LastTenDaysRevenue>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<LastTenDaysRevenue>>,
              List<LastTenDaysRevenue>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<LastTenDaysRevenue>>,
                List<LastTenDaysRevenue>
              >,
              AsyncValue<List<LastTenDaysRevenue>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
