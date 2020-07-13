// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountryModel _$ProductionCountryModelFromJson(
    Map<String, dynamic> json) {
  return ProductionCountryModel(
    iso3166: json['iso_3166_1'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ProductionCountryModelToJson(
        ProductionCountryModel instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso3166,
      'name': instance.name,
    };
