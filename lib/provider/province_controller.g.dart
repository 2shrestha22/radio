// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProvinceController)
const provinceControllerProvider = ProvinceControllerProvider._();

final class ProvinceControllerProvider
    extends $NotifierProvider<ProvinceController, List<Province>> {
  const ProvinceControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'provinceControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$provinceControllerHash();

  @$internal
  @override
  ProvinceController create() => ProvinceController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Province> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Province>>(value),
    );
  }
}

String _$provinceControllerHash() =>
    r'12b5d6361e94962287a65744e4143e991bd3b0f8';

abstract class _$ProvinceController extends $Notifier<List<Province>> {
  List<Province> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Province>, List<Province>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Province>, List<Province>>,
              List<Province>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
