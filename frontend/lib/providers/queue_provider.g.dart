// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PendingQueueProvider)
final pendingQueueProviderProvider = PendingQueueProviderFamily._();

final class PendingQueueProviderProvider
    extends
        $AsyncNotifierProvider<
          PendingQueueProvider,
          List<TransactionHistoryModel>
        > {
  PendingQueueProviderProvider._({
    required PendingQueueProviderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pendingQueueProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pendingQueueProviderHash();

  @override
  String toString() {
    return r'pendingQueueProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PendingQueueProvider create() => PendingQueueProvider();

  @override
  bool operator ==(Object other) {
    return other is PendingQueueProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pendingQueueProviderHash() =>
    r'959d06e7d58890fe2dc37aa615a5813c4986233f';

final class PendingQueueProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          PendingQueueProvider,
          AsyncValue<List<TransactionHistoryModel>>,
          List<TransactionHistoryModel>,
          FutureOr<List<TransactionHistoryModel>>,
          int
        > {
  PendingQueueProviderFamily._()
    : super(
        retry: null,
        name: r'pendingQueueProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PendingQueueProviderProvider call(int stallID) =>
      PendingQueueProviderProvider._(argument: stallID, from: this);

  @override
  String toString() => r'pendingQueueProviderProvider';
}

abstract class _$PendingQueueProvider
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

@ProviderFor(PreparingQueueProvider)
final preparingQueueProviderProvider = PreparingQueueProviderFamily._();

final class PreparingQueueProviderProvider
    extends
        $AsyncNotifierProvider<
          PreparingQueueProvider,
          List<TransactionHistoryModel>
        > {
  PreparingQueueProviderProvider._({
    required PreparingQueueProviderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'preparingQueueProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$preparingQueueProviderHash();

  @override
  String toString() {
    return r'preparingQueueProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PreparingQueueProvider create() => PreparingQueueProvider();

  @override
  bool operator ==(Object other) {
    return other is PreparingQueueProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$preparingQueueProviderHash() =>
    r'0fd113d3c59124d21a42530ef30f70745892e5df';

final class PreparingQueueProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          PreparingQueueProvider,
          AsyncValue<List<TransactionHistoryModel>>,
          List<TransactionHistoryModel>,
          FutureOr<List<TransactionHistoryModel>>,
          int
        > {
  PreparingQueueProviderFamily._()
    : super(
        retry: null,
        name: r'preparingQueueProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PreparingQueueProviderProvider call(int stallID) =>
      PreparingQueueProviderProvider._(argument: stallID, from: this);

  @override
  String toString() => r'preparingQueueProviderProvider';
}

abstract class _$PreparingQueueProvider
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

String _$queueProviderHash() => r'5d38355cc487b59fab5d397cf213e7760dee5838';

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
