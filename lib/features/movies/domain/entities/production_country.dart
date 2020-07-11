import 'package:json_annotation/json_annotation.dart';

part 'production_country.g.dart';

@JsonSerializable(nullable: false)
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  final String iso3166;
  @JsonKey(name: 'name')
  final String name;

  const ProductionCountry({this.iso3166, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}
