import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable(nullable: true)
class MovieModel extends Movie {
  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'video')
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  const MovieModel(
      {this.adult,
      this.backdropPath,
      this.posterPath,
      this.id,
      this.originalLanguage,
      this.title,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.genreIds})
      : super(
            adult: adult,
            backdropPath: backdropPath,
            posterPath: posterPath,
            id: id,
            originalLanguage: originalLanguage,
            title: title,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            releaseDate: releaseDate,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount,
            genreIds: genreIds);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
