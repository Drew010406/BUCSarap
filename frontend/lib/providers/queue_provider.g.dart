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
    r'01c09806da193594afc7208e7abfe95569fd722a';

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

@ProviderFor(PreparingQueueProvider)
final preparingQueueProviderProvider = PreparingQueueProviderProvider._();

final class PreparingQueueProviderProvider
    extends
        $AsyncNotifierProvider<
          PreparingQueueProvider,
          List<TransactionHistoryModel>
        > {
  PreparingQueueProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preparingQueueProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preparingQueueProviderHash();

  @$internal
  @override
  PreparingQueueProvider create() => PreparingQueueProvider();
}

String _$preparingQueueProviderHash() =>
    r'1a31520566ca7dcb32b79c4ed07ce3d40329bb62';

abstract class _$PreparingQueueProvider
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

@ProviderFor(QueueProvider)
final queueProviderProvider = QueueProviderFamily._();

final class QueueProviderProvider
    extends $AsyncNotifierProvider<QueueProvider, Map<String, dynamic>> {
  QueueProviderProvider._({
    required QueueProviderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'queueProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queueProviderHash();

  @override
  String toString() {
    return r'queueProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QueueProvider create() => QueueProvider();

  @override
  bool operator ==(Object other) {
    return other is QueueProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$queueProviderHash() => r'56a7819b901291f9bf2e7e05ac54b5089feb67b4';

final class QueueProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          QueueProvider,
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>,
          int
        > {
  QueueProviderFamily._()
    : super(
        retry: null,
        name: r'queueProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QueueProviderProvider call(int stallID) =>
      QueueProviderProvider._(argument: stallID, from: this);

  @override
  String toString() => r'queueProviderProvider';
}

abstract class _$QueueProvider extends $AsyncNotifier<Map<String, dynamic>> {
  late final _$args = ref.$arg as int;
  int get stallID => _$args;

  FutureOr<Map<String, dynamic>> build(int stallID);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
