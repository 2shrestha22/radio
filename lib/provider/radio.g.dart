// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Radio)
final radioProvider = RadioProvider._();

final class RadioProvider extends $NotifierProvider<Radio, RadioState> {
  RadioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioHash();

  @$internal
  @override
  Radio create() => Radio();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioState>(value),
    );
  }
}

String _$radioHash() => r'ec2decbd263258314c09dd5842a901eeedc98e74';

abstract class _$Radio extends $Notifier<RadioState> {
  RadioState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RadioState, RadioState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RadioState, RadioState>,
              RadioState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
