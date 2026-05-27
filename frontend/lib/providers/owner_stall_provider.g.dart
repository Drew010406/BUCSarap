// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_stall_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OwnerStallCategoryProvider)
final ownerStallCategoryProviderProvider = OwnerStallCategoryProviderFamily._();

final class OwnerStallCategoryProviderProvider
    extends
        $AsyncNotifierProvider<
          OwnerStallCategoryProvider,
          List<CategoryInfoModel>
        > {
  OwnerStallCategoryProviderProvider._({
    required OwnerStallCategoryProviderFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'ownerStallCategoryProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ownerStallCategoryProviderHash();

  @override
  String toString() {
    return r'ownerStallCategoryProviderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  OwnerStallCategoryProvider create() => OwnerStallCategoryProvider();

  @override
  bool operator ==(Object other) {
    return other is OwnerStallCategoryProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ownerStallCategoryProviderHash() =>
    r'bf4113dc5c6d954dbd2204f4c79881ada9b7ad9b';

final class OwnerStallCategoryProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          OwnerStallCategoryProvider,
          AsyncValue<List<CategoryInfoModel>>,
          List<CategoryInfoModel>,
          FutureOr<List<CategoryInfoModel>>,
          (int, int)
        > {
  OwnerStallCategoryProviderFamily._()
    : super(
        retry: null,
        name: r'ownerStallCategoryProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OwnerStallCategoryProviderProvider call(int ownerID, int stallID) =>
      OwnerStallCategoryProviderProvider._(
        argument: (ownerID, stallID),
        from: this,
      );

  @override
  String toString() => r'ownerStallCategoryProviderProvider';
}

abstract class _$OwnerStallCategoryProvider
    extends $AsyncNotifier<List<CategoryInfoModel>> {
  late final _$args = ref.$arg as (int, int);
  int get ownerID => _$args.$1;
  int get stallID => _$args.$2;

  FutureOr<List<CategoryInfoModel>> build(int ownerID, int stallID);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<CategoryInfoModel>>,
              List<CategoryInfoModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CategoryInfoModel>>,
                List<CategoryInfoModel>
              >,
              AsyncValue<List<CategoryInfoModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}

@ProviderFor(OwnerStallProductsByCategoryProvider)
final ownerStallProductsByCategoryProviderProvider =
    OwnerStallProductsByCategoryProviderFamily._();

final class OwnerStallProductsByCategoryProviderProvider
    extends
        $AsyncNotifierProvider<
          OwnerStallProductsByCategoryProvider,
          List<ProductResponseModel>
        > {
  OwnerStallProductsByCategoryProviderProvider._({
    required OwnerStallProductsByCategoryProviderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ownerStallProductsByCategoryProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$ownerStallProductsByCategoryProviderHash();

  @override
  String toString() {
    return r'ownerStallProductsByCategoryProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OwnerStallProductsByCategoryProvider create() =>
      OwnerStallProductsByCategoryProvider();

  @override
  bool operator ==(Object other) {
    return other is OwnerStallProductsByCategoryProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ownerStallProductsByCategoryProviderHash() =>
    r'0316a249370a09e7be87be151184ddb496afe120';

final class OwnerStallProductsByCategoryProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          OwnerStallProductsByCategoryProvider,
          AsyncValue<List<ProductResponseModel>>,
          List<ProductResponseModel>,
          FutureOr<List<ProductResponseModel>>,
          int
        > {
  OwnerStallProductsByCategoryProviderFamily._()
    : super(
        retry: null,
        name: r'ownerStallProductsByCategoryProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OwnerStallProductsByCategoryProviderProvider call(int categoryID) =>
      OwnerStallProductsByCategoryProviderProvider._(
        argument: categoryID,
        from: this,
      );

  @override
  String toString() => r'ownerStallProductsByCategoryProviderProvider';
}

abstract class _$OwnerStallProductsByCategoryProvider
    extends $AsyncNotifier<List<ProductResponseModel>> {
  late final _$args = ref.$arg as int;
  int get categoryID => _$args;

  FutureOr<List<ProductResponseModel>> build(int categoryID);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ProductResponseModel>>,
              List<ProductResponseModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ProductResponseModel>>,
                List<ProductResponseModel>
              >,
              AsyncValue<List<ProductResponseModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
