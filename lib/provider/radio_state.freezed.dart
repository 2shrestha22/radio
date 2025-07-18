// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioState {
  RadioStation? get station;
  RadioPlayerState get playerState;

  /// It will be null if [playerState] is not started or paused.
  StreamingState? get streamingState;
  String? get title;
  int? get bitRate;
  RadioPlayerException? get error;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RadioStateCopyWith<RadioState> get copyWith =>
      _$RadioStateCopyWithImpl<RadioState>(this as RadioState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RadioState &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState) &&
            (identical(other.streamingState, streamingState) ||
                other.streamingState == streamingState) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, station, playerState, streamingState, title, bitRate, error);

  @override
  String toString() {
    return 'RadioState(station: $station, playerState: $playerState, streamingState: $streamingState, title: $title, bitRate: $bitRate, error: $error)';
  }
}

/// @nodoc
abstract mixin class $RadioStateCopyWith<$Res> {
  factory $RadioStateCopyWith(
          RadioState value, $Res Function(RadioState) _then) =
      _$RadioStateCopyWithImpl;
  @useResult
  $Res call(
      {RadioStation? station,
      RadioPlayerState playerState,
      StreamingState? streamingState,
      String? title,
      int? bitRate,
      RadioPlayerException? error});

  $RadioStationCopyWith<$Res>? get station;
}

/// @nodoc
class _$RadioStateCopyWithImpl<$Res> implements $RadioStateCopyWith<$Res> {
  _$RadioStateCopyWithImpl(this._self, this._then);

  final RadioState _self;
  final $Res Function(RadioState) _then;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? station = freezed,
    Object? playerState = null,
    Object? streamingState = freezed,
    Object? title = freezed,
    Object? bitRate = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      station: freezed == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as RadioStation?,
      playerState: null == playerState
          ? _self.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as RadioPlayerState,
      streamingState: freezed == streamingState
          ? _self.streamingState
          : streamingState // ignore: cast_nullable_to_non_nullable
              as StreamingState?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      bitRate: freezed == bitRate
          ? _self.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as RadioPlayerException?,
    ));
  }

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RadioStationCopyWith<$Res>? get station {
    if (_self.station == null) {
      return null;
    }

    return $RadioStationCopyWith<$Res>(_self.station!, (value) {
      return _then(_self.copyWith(station: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RadioState].
extension RadioStatePatterns on RadioState {
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
    TResult Function(_RadioState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioState() when $default != null:
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
    TResult Function(_RadioState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioState():
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
    TResult? Function(_RadioState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioState() when $default != null:
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
    TResult Function(
            RadioStation? station,
            RadioPlayerState playerState,
            StreamingState? streamingState,
            String? title,
            int? bitRate,
            RadioPlayerException? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioState() when $default != null:
        return $default(_that.station, _that.playerState, _that.streamingState,
            _that.title, _that.bitRate, _that.error);
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
    TResult Function(
            RadioStation? station,
            RadioPlayerState playerState,
            StreamingState? streamingState,
            String? title,
            int? bitRate,
            RadioPlayerException? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioState():
        return $default(_that.station, _that.playerState, _that.streamingState,
            _that.title, _that.bitRate, _that.error);
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
    TResult? Function(
            RadioStation? station,
            RadioPlayerState playerState,
            StreamingState? streamingState,
            String? title,
            int? bitRate,
            RadioPlayerException? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioState() when $default != null:
        return $default(_that.station, _that.playerState, _that.streamingState,
            _that.title, _that.bitRate, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RadioState implements RadioState {
  const _RadioState(
      {this.station,
      this.playerState = RadioPlayerState.idle,
      this.streamingState,
      this.title,
      this.bitRate,
      this.error});

  @override
  final RadioStation? station;
  @override
  @JsonKey()
  final RadioPlayerState playerState;

  /// It will be null if [playerState] is not started or paused.
  @override
  final StreamingState? streamingState;
  @override
  final String? title;
  @override
  final int? bitRate;
  @override
  final RadioPlayerException? error;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RadioStateCopyWith<_RadioState> get copyWith =>
      __$RadioStateCopyWithImpl<_RadioState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RadioState &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState) &&
            (identical(other.streamingState, streamingState) ||
                other.streamingState == streamingState) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, station, playerState, streamingState, title, bitRate, error);

  @override
  String toString() {
    return 'RadioState(station: $station, playerState: $playerState, streamingState: $streamingState, title: $title, bitRate: $bitRate, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$RadioStateCopyWith<$Res>
    implements $RadioStateCopyWith<$Res> {
  factory _$RadioStateCopyWith(
          _RadioState value, $Res Function(_RadioState) _then) =
      __$RadioStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RadioStation? station,
      RadioPlayerState playerState,
      StreamingState? streamingState,
      String? title,
      int? bitRate,
      RadioPlayerException? error});

  @override
  $RadioStationCopyWith<$Res>? get station;
}

/// @nodoc
class __$RadioStateCopyWithImpl<$Res> implements _$RadioStateCopyWith<$Res> {
  __$RadioStateCopyWithImpl(this._self, this._then);

  final _RadioState _self;
  final $Res Function(_RadioState) _then;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? station = freezed,
    Object? playerState = null,
    Object? streamingState = freezed,
    Object? title = freezed,
    Object? bitRate = freezed,
    Object? error = freezed,
  }) {
    return _then(_RadioState(
      station: freezed == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as RadioStation?,
      playerState: null == playerState
          ? _self.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as RadioPlayerState,
      streamingState: freezed == streamingState
          ? _self.streamingState
          : streamingState // ignore: cast_nullable_to_non_nullable
              as StreamingState?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      bitRate: freezed == bitRate
          ? _self.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as RadioPlayerException?,
    ));
  }

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RadioStationCopyWith<$Res>? get station {
    if (_self.station == null) {
      return null;
    }

    return $RadioStationCopyWith<$Res>(_self.station!, (value) {
      return _then(_self.copyWith(station: value));
    });
  }
}

// dart format on
