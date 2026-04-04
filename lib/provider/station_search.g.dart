// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StationSearch)
const stationSearchProvider = StationSearchProvider._();

final class StationSearchProvider
    extends $NotifierProvider<StationSearch, List<RadioStation>> {
  const StationSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationSearchHash();

  @$internal
  @override
  StationSearch create() => StationSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RadioStation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RadioStation>>(value),
    );
  }
}

String _$stationSearchHash() => r'bec395af7b49aaa2603ed0f223c616721dc06d50';

abstract class _$StationSearch extends $Notifier<List<RadioStation>> {
  List<RadioStation> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<RadioStation>, List<RadioStation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RadioStation>, List<RadioStation>>,
              List<RadioStation>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
