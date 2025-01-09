// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'declared_dog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeclaredDog _$DeclaredDogFromJson(Map<String, dynamic> json) {
  return _DeclaredDog.fromJson(json);
}

/// @nodoc
mixin _$DeclaredDog {
  String? get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  num get notVisibleCount =>
      throw _privateConstructorUsedError; // Incrément à chaque fois qu'un chien est déclaré non visible
  num get visibleCount =>
      throw _privateConstructorUsedError; // Incrément à chaque fois qu'un chien est déclaré visible
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this DeclaredDog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeclaredDog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclaredDogCopyWith<DeclaredDog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclaredDogCopyWith<$Res> {
  factory $DeclaredDogCopyWith(
          DeclaredDog value, $Res Function(DeclaredDog) then) =
      _$DeclaredDogCopyWithImpl<$Res, DeclaredDog>;
  @useResult
  $Res call(
      {String? id,
      double latitude,
      double longitude,
      @TimestampConverter() Timestamp? createdAt,
      num notVisibleCount,
      num visibleCount,
      String userId});
}

/// @nodoc
class _$DeclaredDogCopyWithImpl<$Res, $Val extends DeclaredDog>
    implements $DeclaredDogCopyWith<$Res> {
  _$DeclaredDogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclaredDog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? createdAt = freezed,
    Object? notVisibleCount = null,
    Object? visibleCount = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      notVisibleCount: null == notVisibleCount
          ? _value.notVisibleCount
          : notVisibleCount // ignore: cast_nullable_to_non_nullable
              as num,
      visibleCount: null == visibleCount
          ? _value.visibleCount
          : visibleCount // ignore: cast_nullable_to_non_nullable
              as num,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeclaredDogImplCopyWith<$Res>
    implements $DeclaredDogCopyWith<$Res> {
  factory _$$DeclaredDogImplCopyWith(
          _$DeclaredDogImpl value, $Res Function(_$DeclaredDogImpl) then) =
      __$$DeclaredDogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      double latitude,
      double longitude,
      @TimestampConverter() Timestamp? createdAt,
      num notVisibleCount,
      num visibleCount,
      String userId});
}

/// @nodoc
class __$$DeclaredDogImplCopyWithImpl<$Res>
    extends _$DeclaredDogCopyWithImpl<$Res, _$DeclaredDogImpl>
    implements _$$DeclaredDogImplCopyWith<$Res> {
  __$$DeclaredDogImplCopyWithImpl(
      _$DeclaredDogImpl _value, $Res Function(_$DeclaredDogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeclaredDog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? createdAt = freezed,
    Object? notVisibleCount = null,
    Object? visibleCount = null,
    Object? userId = null,
  }) {
    return _then(_$DeclaredDogImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      notVisibleCount: null == notVisibleCount
          ? _value.notVisibleCount
          : notVisibleCount // ignore: cast_nullable_to_non_nullable
              as num,
      visibleCount: null == visibleCount
          ? _value.visibleCount
          : visibleCount // ignore: cast_nullable_to_non_nullable
              as num,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeclaredDogImpl implements _DeclaredDog {
  const _$DeclaredDogImpl(
      {this.id,
      required this.latitude,
      required this.longitude,
      @TimestampConverter() this.createdAt,
      required this.notVisibleCount,
      required this.visibleCount,
      required this.userId});

  factory _$DeclaredDogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclaredDogImplFromJson(json);

  @override
  final String? id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  final num notVisibleCount;
// Incrément à chaque fois qu'un chien est déclaré non visible
  @override
  final num visibleCount;
// Incrément à chaque fois qu'un chien est déclaré visible
  @override
  final String userId;

  @override
  String toString() {
    return 'DeclaredDog(id: $id, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, notVisibleCount: $notVisibleCount, visibleCount: $visibleCount, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclaredDogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notVisibleCount, notVisibleCount) ||
                other.notVisibleCount == notVisibleCount) &&
            (identical(other.visibleCount, visibleCount) ||
                other.visibleCount == visibleCount) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, latitude, longitude,
      createdAt, notVisibleCount, visibleCount, userId);

  /// Create a copy of DeclaredDog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclaredDogImplCopyWith<_$DeclaredDogImpl> get copyWith =>
      __$$DeclaredDogImplCopyWithImpl<_$DeclaredDogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclaredDogImplToJson(
      this,
    );
  }
}

abstract class _DeclaredDog implements DeclaredDog {
  const factory _DeclaredDog(
      {final String? id,
      required final double latitude,
      required final double longitude,
      @TimestampConverter() final Timestamp? createdAt,
      required final num notVisibleCount,
      required final num visibleCount,
      required final String userId}) = _$DeclaredDogImpl;

  factory _DeclaredDog.fromJson(Map<String, dynamic> json) =
      _$DeclaredDogImpl.fromJson;

  @override
  String? get id;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  num get notVisibleCount; // Incrément à chaque fois qu'un chien est déclaré non visible
  @override
  num get visibleCount; // Incrément à chaque fois qu'un chien est déclaré visible
  @override
  String get userId;

  /// Create a copy of DeclaredDog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclaredDogImplCopyWith<_$DeclaredDogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
