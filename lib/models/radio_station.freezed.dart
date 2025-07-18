// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioStation {
  String get id;
  String get name;
  String get streamUrl;
  double? get frequency;
  String? get address;
  bool get fav;
  int? get province;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RadioStationCopyWith<RadioStation> get copyWith =>
      _$RadioStationCopyWithImpl<RadioStation>(
          this as RadioStation, _$identity);

  /// Serializes this RadioStation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RadioStation &&
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

  @override
  String toString() {
    return 'RadioStation(id: $id, name: $name, streamUrl: $streamUrl, frequency: $frequency, address: $address, fav: $fav, province: $province)';
  }
}

/// @nodoc
abstract mixin class $RadioStationCopyWith<$Res> {
  factory $RadioStationCopyWith(
          RadioStation value, $Res Function(RadioStation) _then) =
      _$RadioStationCopyWithImpl;
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
class _$RadioStationCopyWithImpl<$Res> implements $RadioStationCopyWith<$Res> {
  _$RadioStationCopyWithImpl(this._self, this._then);

  final RadioStation _self;
  final $Res Function(RadioStation) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: freezed == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: null == fav
          ? _self.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as bool,
      province: freezed == province
          ? _self.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RadioStation].
extension RadioStationPatterns on RadioStation {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RadioStation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RadioStation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RadioStation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String streamUrl,
            double? frequency, String? address, bool fav, int? province)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that.id, _that.name, _that.streamUrl, _that.frequency,
            _that.address, _that.fav, _that.province);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String streamUrl,
            double? frequency, String? address, bool fav, int? province)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation():
        return $default(_that.id, _that.name, _that.streamUrl, _that.frequency,
            _that.address, _that.fav, _that.province);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String streamUrl,
            double? frequency, String? address, bool fav, int? province)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioStation() when $default != null:
        return $default(_that.id, _that.name, _that.streamUrl, _that.frequency,
            _that.address, _that.fav, _that.province);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RadioStation extends RadioStation {
  const _RadioStation(
      {required this.id,
      required this.name,
      required this.streamUrl,
      required this.frequency,
      required this.address,
      this.fav = false,
      this.province})
      : super._();
  factory _RadioStation.fromJson(Map<String, dynamic> json) =>
      _$RadioStationFromJson(json);

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

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RadioStationCopyWith<_RadioStation> get copyWith =>
      __$RadioStationCopyWithImpl<_RadioStation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RadioStationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RadioStation &&
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

  @override
  String toString() {
    return 'RadioStation(id: $id, name: $name, streamUrl: $streamUrl, frequency: $frequency, address: $address, fav: $fav, province: $province)';
  }
}

/// @nodoc
abstract mixin class _$RadioStationCopyWith<$Res>
    implements $RadioStationCopyWith<$Res> {
  factory _$RadioStationCopyWith(
          _RadioStation value, $Res Function(_RadioStation) _then) =
      __$RadioStationCopyWithImpl;
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
class __$RadioStationCopyWithImpl<$Res>
    implements _$RadioStationCopyWith<$Res> {
  __$RadioStationCopyWithImpl(this._self, this._then);

  final _RadioStation _self;
  final $Res Function(_RadioStation) _then;

  /// Create a copy of RadioStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? streamUrl = null,
    Object? frequency = freezed,
    Object? address = freezed,
    Object? fav = null,
    Object? province = freezed,
  }) {
    return _then(_RadioStation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: freezed == frequency
          ? _self.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: null == fav
          ? _self.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as bool,
      province: freezed == province
          ? _self.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
