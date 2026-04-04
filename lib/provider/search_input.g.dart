// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_input.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchInput)
const searchInputProvider = SearchInputProvider._();

final class SearchInputProvider extends $NotifierProvider<SearchInput, String> {
  const SearchInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchInputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchInputHash();

  @$internal
  @override
  SearchInput create() => SearchInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchInputHash() => r'1b1d7bce09052f39a4e7fd73a1a52daf36c620b0';

abstract class _$SearchInput extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
