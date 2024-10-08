// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RadioStation _$RadioStationFromJson(Map<String, dynamic> json) {
  return _RadioStation.fromJson(json);
}

/// @nodoc
mixin _$RadioStation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get streamUrl => throw _privateConstructorUsedError;
  double? get frequency => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  bool get fav => throw _privateConstructorUsedError;
  int? get province => throw _privateConstructorUsedError;

  /// Serializes this RadioStation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RadioStationCopyWith<RadioStation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioStationCopyWith<$Res> {
  factory $RadioStationCopyWith(
          RadioStation value, $Res Function(RadioStation) then) =
      _$RadioStationCopyWithImpl<$Res, RadioStation>;
  @useResult
  $Res call(
      {String id,
      String name,
      String streamUrl,
      double? frequency,
      String? address,
      bool fav,
      int? province});
}

/// @nodoc
class _$RadioStationCopyWithImpl<$Res, $Val extends RadioStation>
    implements $RadioStationCopyWith<$Res> {
  _$RadioStationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? streamUrl = null,
    Object? frequency = freezed,
    Object? address = freezed,
    Object? fav = null,
    Object? province = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _value.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: null == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as bool,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadioStationImplCopyWith<$Res>
    implements $RadioStationCopyWith<$Res> {
  factory _$$RadioStationImplCopyWith(
          _$RadioStationImpl value, $Res Function(_$RadioStationImpl) then) =
      __$$RadioStationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String streamUrl,
      double? frequency,
      String? address,
      bool fav,
      int? province});
}

/// @nodoc
class __$$RadioStationImplCopyWithImpl<$Res>
    extends _$RadioStationCopyWithImpl<$Res, _$RadioStationImpl>
    implements _$$RadioStationImplCopyWith<$Res> {
  __$$RadioStationImplCopyWithImpl(
      _$RadioStationImpl _value, $Res Function(_$RadioStationImpl) _then)
      : super(_value, _then);

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? streamUrl = null,
    Object? frequency = freezed,
    Object? address = freezed,
    Object? fav = null,
    Object? province = freezed,
  }) {
    return _then(_$RadioStationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _value.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: null == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as bool,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RadioStationImpl extends _RadioStation {
  const _$RadioStationImpl(
      {required this.id,
      required this.name,
      required this.streamUrl,
      required this.frequency,
      required this.address,
      this.fav = false,
      this.province})
      : super._();

  factory _$RadioStationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadioStationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String streamUrl;
  @override
  final double? frequency;
  @override
  final String? address;
  @override
  @JsonKey()
  final bool fav;
  @override
  final int? province;

  @override
  String toString() {
    return 'RadioStation(id: $id, name: $name, streamUrl: $streamUrl, frequency: $frequency, address: $address, fav: $fav, province: $province)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioStationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fav, fav) || other.fav == fav) &&
            (identical(other.province, province) ||
                other.province == province));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, streamUrl, frequency, address, fav, province);

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioStationImplCopyWith<_$RadioStationImpl> get copyWith =>
      __$$RadioStationImplCopyWithImpl<_$RadioStationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RadioStationImplToJson(
      this,
    );
  }
}

abstract class _RadioStation extends RadioStation {
  const factory _RadioStation(
      {required final String id,
      required final String name,
      required final String streamUrl,
      required final double? frequency,
      required final String? address,
      final bool fav,
      final int? province}) = _$RadioStationImpl;
  const _RadioStation._() : super._();

  factory _RadioStation.fromJson(Map<String, dynamic> json) =
      _$RadioStationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get streamUrl;
  @override
  double? get frequency;
  @override
  String? get address;
  @override
  bool get fav;
  @override
  int? get province;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RadioStationImplCopyWith<_$RadioStationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
