import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/genre.dart';

part 'genre_model.g.dart';

@JsonSerializable(nullable: true)
class GenreModel extends Genre {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  const GenreModel({
    this.id,
    this.name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
