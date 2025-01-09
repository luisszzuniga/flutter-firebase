import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'declared_dog.freezed.dart';
part 'declared_dog.g.dart';

@freezed
class DeclaredDog with _$DeclaredDog {
  const factory DeclaredDog({
    String? id,
    required double latitude,
    required double longitude,
    @TimestampConverter() Timestamp? createdAt,
    required num notVisibleCount, // Incrément à chaque fois qu'un chien est déclaré non visible
    required num visibleCount, // Incrément à chaque fois qu'un chien est déclaré visible
    required String userId,
  }) = _DeclaredDog;

  factory DeclaredDog.fromJson(Map<String, dynamic> json) =>
      _$DeclaredDogFromJson(json);
}

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      return Timestamp.fromMillisecondsSinceEpoch(json['seconds'] * 1000);
    } else if (json is Timestamp) {
      return json;
    } else {
      throw Exception('Invalid Timestamp format');
    }
  }

  @override
  Object toJson(Timestamp timestamp) => timestamp.toDate().toIso8601String();
}