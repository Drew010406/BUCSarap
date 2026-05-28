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
