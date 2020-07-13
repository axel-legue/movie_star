import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/spoken_language.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable(nullable: true)
class SpokenLanguageModel extends SpokenLanguage {
  @JsonKey(name: 'iso_639_1')
  final String iso639;
  @JsonKey(name: 'name')
  final String name;

  const SpokenLanguageModel({
    this.iso639,
    this.name,
  }) : super(
          iso639: iso639,
          name: name,
        );

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}
