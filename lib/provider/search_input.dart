import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_input.g.dart';
// final searchInputProvider = StateProvider<String>((ref) => '');

@riverpod
class SearchInput extends _$SearchInput {
  @override
  String build() => '';

  void onChange(String value) => state = value;
}
