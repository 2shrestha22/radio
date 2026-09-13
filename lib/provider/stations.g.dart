// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stations.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Stations)
final stationsProvider = StationsProvider._();

final class StationsProvider
    extends $NotifierProvider<Stations, List<RadioStation>> {
  StationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationsHash();

  @$internal
  @override
  Stations create() => Stations();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RadioStation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RadioStation>>(value),
    );
  }
}

String _$stationsHash() => r'4475b54a9d3cd984314a756537418a52a5a6d9f0';

abstract class _$Stations extends $Notifier<List<RadioStation>> {
  List<RadioStation> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<RadioStation>, List<RadioStation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RadioStation>, List<RadioStation>>,
              List<RadioStation>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
