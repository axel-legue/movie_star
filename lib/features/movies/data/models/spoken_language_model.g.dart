// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguageModel _$SpokenLanguageModelFromJson(Map<String, dynamic> json) {
  return SpokenLanguageModel(
    iso639: json['iso_639_1'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguageModelToJson(
        SpokenLanguageModel instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso639,
      'name': instance.name,
    };
