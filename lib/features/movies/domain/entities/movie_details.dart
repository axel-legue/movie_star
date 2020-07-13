import 'package:equatable/equatable.dart';
import 'package:movie_star/features/movies/domain/entities/belongs_to_collection.dart';
import 'package:movie_star/features/movies/domain/entities/genre.dart';
import 'package:movie_star/features/movies/domain/entities/production_company.dart';
import 'package:movie_star/features/movies/domain/entities/production_country.dart';
import 'package:movie_star/features/movies/domain/entities/spoken_language.dart';

class MovieDetails extends Equatable {
  final bool adult;
  final String backdropPath;
  final BelongsToCollection belongsToCollection;
  final int budget;
  final List<Genre> genreList;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagLine;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetails({
    this.adult,
    this.title,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genreList,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagLine,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object> get props => [
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genreList,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagLine,
        this.video,
        this.voteAverage,
        this.voteCount
      ];

  @override
  bool get stringify => true;
}
