// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_stations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteStations)
const favoriteStationsProvider = FavoriteStationsProvider._();

final class FavoriteStationsProvider
    extends $NotifierProvider<FavoriteStations, List<RadioStation>> {
  const FavoriteStationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteStationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteStationsHash();

  @$internal
  @override
  FavoriteStations create() => FavoriteStations();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RadioStation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RadioStation>>(value),
    );
  }
}

String _$favoriteStationsHash() => r'28cd684ad065ce7b567e1dafba57093707af1724';

abstract class _$FavoriteStations extends $Notifier<List<RadioStation>> {
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
