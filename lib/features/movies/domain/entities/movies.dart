import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';

part 'movies.g.dart';

@JsonSerializable(nullable: false)
class Movies extends Equatable {
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'results')
  final List<Movie> movies;

  const Movies({this.page, this.totalResults, this.totalPages, this.movies});

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);

  @override
  List<Object> get props => [
        this.page,
        this.totalResults,
        this.totalPages,
        this.movies,
      ];
}
