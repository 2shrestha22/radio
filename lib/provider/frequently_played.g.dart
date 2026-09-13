// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequently_played.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FrequentlyPlayed)
final frequentlyPlayedProvider = FrequentlyPlayedProvider._();

final class FrequentlyPlayedProvider
    extends $NotifierProvider<FrequentlyPlayed, List<RadioStation>> {
  FrequentlyPlayedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'frequentlyPlayedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$frequentlyPlayedHash();

  @$internal
  @override
  FrequentlyPlayed create() => FrequentlyPlayed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RadioStation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RadioStation>>(value),
    );
  }
}

String _$frequentlyPlayedHash() => r'94c25030944721446fa8c74962bdd391de4c29c3';

abstract class _$FrequentlyPlayed extends $Notifier<List<RadioStation>> {
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
