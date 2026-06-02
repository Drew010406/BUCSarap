// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReceiptNotifier)
final receiptProvider = ReceiptNotifierProvider._();

final class ReceiptNotifierProvider
    extends $AsyncNotifierProvider<ReceiptNotifier, List<File>> {
  ReceiptNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiptProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiptNotifierHash();

  @$internal
  @override
  ReceiptNotifier create() => ReceiptNotifier();
}

String _$receiptNotifierHash() => r'3afe21131f8af93954240e8c17ef8c2eac9a4b8d';

abstract class _$ReceiptNotifier extends $AsyncNotifier<List<File>> {
  FutureOr<List<File>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<File>>, List<File>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<File>>, List<File>>,
              AsyncValue<List<File>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
