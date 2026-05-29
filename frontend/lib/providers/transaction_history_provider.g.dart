// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionHistoryProvider)
final transactionHistoryProviderProvider = TransactionHistoryProviderFamily._();

final class TransactionHistoryProviderProvider
    extends
        $AsyncNotifierProvider<
          TransactionHistoryProvider,
          List<TransactionHistoryModel>
        > {
  TransactionHistoryProviderProvider._({
    required TransactionHistoryProviderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'transactionHistoryProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionHistoryProviderHash();

  @override
  String toString() {
    return r'transactionHistoryProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TransactionHistoryProvider create() => TransactionHistoryProvider();

  @override
  bool operator ==(Object other) {
    return other is TransactionHistoryProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionHistoryProviderHash() =>
    r'6eb08f27076d30516e1bbdb122b0c6e4b71c9b29';

final class TransactionHistoryProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          TransactionHistoryProvider,
          AsyncValue<List<TransactionHistoryModel>>,
          List<TransactionHistoryModel>,
          FutureOr<List<TransactionHistoryModel>>,
          int
        > {
  TransactionHistoryProviderFamily._()
    : super(
        retry: null,
        name: r'transactionHistoryProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionHistoryProviderProvider call(int stallID) =>
      TransactionHistoryProviderProvider._(argument: stallID, from: this);

  @override
  String toString() => r'transactionHistoryProviderProvider';
}

abstract class _$TransactionHistoryProvider
    extends $AsyncNotifier<List<TransactionHistoryModel>> {
  late final _$args = ref.$arg as int;
  int get stallID => _$args;

  FutureOr<List<TransactionHistoryModel>> build(int stallID);
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
    element.handleCreate(ref, () => build(_$args));
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
