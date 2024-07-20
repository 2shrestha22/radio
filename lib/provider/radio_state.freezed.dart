// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RadioState {
  RadioStation? get station => throw _privateConstructorUsedError;
  RadioPlayerState get playerState => throw _privateConstructorUsedError;

  /// It will be null if [playerState] is not started or paused.
  StreamingState? get streamingState => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get bitRate => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RadioStateCopyWith<RadioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioStateCopyWith<$Res> {
  factory $RadioStateCopyWith(
          RadioState value, $Res Function(RadioState) then) =
      _$RadioStateCopyWithImpl<$Res, RadioState>;
  @useResult
  $Res call(
      {RadioStation? station,
      RadioPlayerState playerState,
      StreamingState? streamingState,
      String? title,
      int? bitRate,
      Object? error});

  $RadioStationCopyWith<$Res>? get station;
}

/// @nodoc
class _$RadioStateCopyWithImpl<$Res, $Val extends RadioState>
    implements $RadioStateCopyWith<$Res> {
  _$RadioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      station: freezed == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as RadioStation?,
      playerState: null == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as RadioPlayerState,
      streamingState: freezed == streamingState
          ? _value.streamingState
          : streamingState // ignore: cast_nullable_to_non_nullable
              as StreamingState?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RadioStationCopyWith<$Res>? get station {
    if (_value.station == null) {
      return null;
    }

    return $RadioStationCopyWith<$Res>(_value.station!, (value) {
      return _then(_value.copyWith(station: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RadioStateImplCopyWith<$Res>
    implements $RadioStateCopyWith<$Res> {
  factory _$$RadioStateImplCopyWith(
          _$RadioStateImpl value, $Res Function(_$RadioStateImpl) then) =
      __$$RadioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RadioStation? station,
      RadioPlayerState playerState,
      StreamingState? streamingState,
      String? title,
      int? bitRate,
      Object? error});

  @override
  $RadioStationCopyWith<$Res>? get station;
}

/// @nodoc
class __$$RadioStateImplCopyWithImpl<$Res>
    extends _$RadioStateCopyWithImpl<$Res, _$RadioStateImpl>
    implements _$$RadioStateImplCopyWith<$Res> {
  __$$RadioStateImplCopyWithImpl(
      _$RadioStateImpl _value, $Res Function(_$RadioStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$RadioStateImpl(
      station: freezed == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as RadioStation?,
      playerState: null == playerState
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as RadioPlayerState,
      streamingState: freezed == streamingState
          ? _value.streamingState
          : streamingState // ignore: cast_nullable_to_non_nullable
              as StreamingState?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$RadioStateImpl implements _RadioState {
  const _$RadioStateImpl(
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
  final Object? error;

  @override
  String toString() {
    return 'RadioState(station: $station, playerState: $playerState, streamingState: $streamingState, title: $title, bitRate: $bitRate, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioStateImpl &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.playerState, playerState) ||
                other.playerState == playerState) &&
            (identical(other.streamingState, streamingState) ||
                other.streamingState == streamingState) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      station,
      playerState,
      streamingState,
      title,
      bitRate,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioStateImplCopyWith<_$RadioStateImpl> get copyWith =>
      __$$RadioStateImplCopyWithImpl<_$RadioStateImpl>(this, _$identity);
}

abstract class _RadioState implements RadioState {
  const factory _RadioState(
      {final RadioStation? station,
      final RadioPlayerState playerState,
      final StreamingState? streamingState,
      final String? title,
      final int? bitRate,
      final Object? error}) = _$RadioStateImpl;

  @override
  RadioStation? get station;
  @override
  RadioPlayerState get playerState;
  @override

  /// It will be null if [playerState] is not started or paused.
  StreamingState? get streamingState;
  @override
  String? get title;
  @override
  int? get bitRate;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$RadioStateImplCopyWith<_$RadioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
