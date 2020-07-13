import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/production_company.dart';

part 'production_company_model.g.dart';

@JsonSerializable(nullable: true)
class ProductionCompanyModel extends ProductionCompany {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  const ProductionCompanyModel({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  }) : super(
          id: id,
          logoPath: logoPath,
          name: name,
          originCountry: originCountry,
        );

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}
