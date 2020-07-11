import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(nullable: false)
class Movie extends Equatable {
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


  const Movie({
    this.adult,
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
    this.genreIds});

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);


  @override
  List<Object> get props =>
      [
        this.adult,
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
        this.genreIds
      ];

  @override
  bool get stringify => true;

}
