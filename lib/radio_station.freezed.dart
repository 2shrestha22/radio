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
  @JsonKey(name: 'freq')
  double? get frequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'addr')
  String? get address => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get province => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'freq') double? frequency,
      @JsonKey(name: 'addr') String? address,
      String url,
      String? logo,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? frequency = freezed,
    Object? address = freezed,
    Object? url = null,
    Object? logo = freezed,
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
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'freq') double? frequency,
      @JsonKey(name: 'addr') String? address,
      String url,
      String? logo,
      int? province});
}

/// @nodoc
class __$$RadioStationImplCopyWithImpl<$Res>
    extends _$RadioStationCopyWithImpl<$Res, _$RadioStationImpl>
    implements _$$RadioStationImplCopyWith<$Res> {
  __$$RadioStationImplCopyWithImpl(
      _$RadioStationImpl _value, $Res Function(_$RadioStationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? frequency = freezed,
    Object? address = freezed,
    Object? url = null,
    Object? logo = freezed,
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
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'freq') required this.frequency,
      @JsonKey(name: 'addr') required this.address,
      required this.url,
      required this.logo,
      required this.province})
      : super._();

  factory _$RadioStationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadioStationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'freq')
  final double? frequency;
  @override
  @JsonKey(name: 'addr')
  final String? address;
  @override
  final String url;
  @override
  final String? logo;
  @override
  final int? province;

  @override
  String toString() {
    return 'RadioStation(id: $id, name: $name, frequency: $frequency, address: $address, url: $url, logo: $logo, province: $province)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioStationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.province, province) ||
                other.province == province));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, frequency, address, url, logo, province);

  @JsonKey(ignore: true)
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
      @JsonKey(name: 'freq') required final double? frequency,
      @JsonKey(name: 'addr') required final String? address,
      required final String url,
      required final String? logo,
      required final int? province}) = _$RadioStationImpl;
  const _RadioStation._() : super._();

  factory _RadioStation.fromJson(Map<String, dynamic> json) =
      _$RadioStationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'freq')
  double? get frequency;
  @override
  @JsonKey(name: 'addr')
  String? get address;
  @override
  String get url;
  @override
  String? get logo;
  @override
  int? get province;
  @override
  @JsonKey(ignore: true)
  _$$RadioStationImplCopyWith<_$RadioStationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
