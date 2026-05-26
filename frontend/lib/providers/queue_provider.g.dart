// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PendingQueueProvider)
final pendingQueueProviderProvider = PendingQueueProviderProvider._();

final class PendingQueueProviderProvider
    extends
        $AsyncNotifierProvider<
          PendingQueueProvider,
          List<TransactionHistoryModel>
        > {
  PendingQueueProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingQueueProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingQueueProviderHash();

  @$internal
  @override
  PendingQueueProvider create() => PendingQueueProvider();
}

String _$pendingQueueProviderHash() =>
    r'81e99dcb15925ab948cc203881864ec9ad59cc99';

abstract class _$PendingQueueProvider
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
