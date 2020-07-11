// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return SpokenLanguage(
    iso639: json['iso_639_1'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso639,
      'name': instance.name,
    };
