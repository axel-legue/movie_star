// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belongs_to_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BelongsToCollectionModel _$BelongsToCollectionModelFromJson(
    Map<String, dynamic> json) {
  return BelongsToCollectionModel(
    id: json['id'] as int,
    name: json['name'] as String,
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
  );
}

Map<String, dynamic> _$BelongsToCollectionModelToJson(
        BelongsToCollectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
