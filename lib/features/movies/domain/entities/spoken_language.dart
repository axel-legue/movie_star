import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable(nullable: false)
class SpokenLanguage {
  @JsonKey(name: 'iso_639_1')
  final String iso639;
  @JsonKey(name: 'name')
  final String name;

  const SpokenLanguage({this.iso639, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String,dynamic> toJson() => _$SpokenLanguageToJson(this);
}
