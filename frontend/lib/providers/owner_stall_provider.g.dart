// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_stall_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OwnerStallCategoryProvider)
final ownerStallCategoryProviderProvider =
    OwnerStallCategoryProviderProvider._();

final class OwnerStallCategoryProviderProvider
    extends
        $AsyncNotifierProvider<
          OwnerStallCategoryProvider,
          List<CategoryInfoModel>
        > {
  OwnerStallCategoryProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownerStallCategoryProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownerStallCategoryProviderHash();

  @$internal
  @override
  OwnerStallCategoryProvider create() => OwnerStallCategoryProvider();
}

String _$ownerStallCategoryProviderHash() =>
    r'c9dfa896e2758a314ca8caf60e3a882988a39f6e';

abstract class _$OwnerStallCategoryProvider
    extends $AsyncNotifier<List<CategoryInfoModel>> {
  FutureOr<List<CategoryInfoModel>> build();
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
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OwnerStallProductsByCategoryProvider)
final ownerStallProductsByCategoryProviderProvider =
    OwnerStallProductsByCategoryProviderProvider._();

final class OwnerStallProductsByCategoryProviderProvider
    extends
        $AsyncNotifierProvider<
          OwnerStallProductsByCategoryProvider,
          List<ProductResponseModel>
        > {
  OwnerStallProductsByCategoryProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownerStallProductsByCategoryProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$ownerStallProductsByCategoryProviderHash();

  @$internal
  @override
  OwnerStallProductsByCategoryProvider create() =>
      OwnerStallProductsByCategoryProvider();
}

String _$ownerStallProductsByCategoryProviderHash() =>
    r'5420879b81ac5ef2960fc18c7d96ebad9fb7d463';

abstract class _$OwnerStallProductsByCategoryProvider
    extends $AsyncNotifier<List<ProductResponseModel>> {
  FutureOr<List<ProductResponseModel>> build();
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
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OwnerStall)
final ownerStallProvider = OwnerStallProvider._();

final class OwnerStallProvider
    extends $AsyncNotifierProvider<OwnerStall, StallResponseModel> {
  OwnerStallProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownerStallProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownerStallHash();

  @$internal
  @override
  OwnerStall create() => OwnerStall();
}

String _$ownerStallHash() => r'118b6236af6bd67e0bcaff831f34e79a6f0cf8cb';

abstract class _$OwnerStall extends $AsyncNotifier<StallResponseModel> {
  FutureOr<StallResponseModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<StallResponseModel>, StallResponseModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<StallResponseModel>, StallResponseModel>,
              AsyncValue<StallResponseModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
