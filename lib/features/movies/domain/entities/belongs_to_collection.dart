import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection.g.dart';

@JsonSerializable(nullable: false)
class BelongsToCollection {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  const BelongsToCollection(
      {this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}
