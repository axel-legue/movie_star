import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable(nullable: false)
class Genre{
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

 const Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String,dynamic> toJson() => _$GenreToJson(this);

}