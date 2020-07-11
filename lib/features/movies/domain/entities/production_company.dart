import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable(nullable: false)
class ProductionCompany {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  const ProductionCompany(
      {this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
