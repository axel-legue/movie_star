import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/production_country.dart';

part 'production_country_model.g.dart';

@JsonSerializable(nullable: true)
class ProductionCountryModel extends ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  final String iso3166;
  @JsonKey(name: 'name')
  final String name;

  const ProductionCountryModel({
    this.iso3166,
    this.name,
  }) : super(
          iso3166: iso3166,
          name: name,
        );

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);
}
