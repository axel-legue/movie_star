import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/belongs_to_collection.dart';

part 'belongs_to_collection_model.g.dart';

@JsonSerializable(nullable: true)
class BelongsToCollectionModel extends BelongsToCollection {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  const BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  }) : super(
          id: id,
          name: name,
          posterPath: posterPath,
          backdropPath: backdropPath,
        );

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionModelToJson(this);
}
