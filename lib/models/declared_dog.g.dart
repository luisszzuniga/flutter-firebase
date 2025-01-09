// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declared_dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeclaredDogImpl _$$DeclaredDogImplFromJson(Map<String, dynamic> json) =>
    _$DeclaredDogImpl(
      id: json['id'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      createdAt: _$JsonConverterFromJson<Object, Timestamp>(
          json['createdAt'], const TimestampConverter().fromJson),
      notVisibleCount: json['notVisibleCount'] as num,
      visibleCount: json['visibleCount'] as num,
      userId: json['userId'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$DeclaredDogImplToJson(_$DeclaredDogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdAt': _$JsonConverterToJson<Object, Timestamp>(
          instance.createdAt, const TimestampConverter().toJson),
      'notVisibleCount': instance.notVisibleCount,
      'visibleCount': instance.visibleCount,
      'userId': instance.userId,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
