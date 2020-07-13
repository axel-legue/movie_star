import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final bool adult;
  final String backdropPath;
  final String posterPath;
  final int id;
  final String originalLanguage;
  final String title;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  const Movie(
      {
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

  @override
  List<Object> get props => [
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
