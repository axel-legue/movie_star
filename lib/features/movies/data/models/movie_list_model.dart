import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/data/models/movie_model.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';

part 'movie_list_model.g.dart';

@JsonSerializable(nullable: true)
class MovieListModel extends Movies {
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'results')
  final List<MovieModel> movies;

  const MovieListModel({
    this.page,
    this.totalResults,
    this.totalPages,
    this.movies,
  }) : super(
          page: page,
          totalResults: totalResults,
          totalPages: totalPages,
          movies: movies,
        );

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListModelToJson(this);
}
