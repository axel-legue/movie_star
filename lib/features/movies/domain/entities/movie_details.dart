import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/domain/entities/belongs_to_collection.dart';
import 'package:movie_star/features/movies/domain/entities/genre.dart';
import 'package:movie_star/features/movies/domain/entities/production_company.dart';
import 'package:movie_star/features/movies/domain/entities/production_country.dart';
import 'package:movie_star/features/movies/domain/entities/spoken_language.dart';

part 'movie_details.g.dart';

@JsonSerializable(nullable: false)
class MovieDetails extends Equatable {
  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection belongsToCollection;
  @JsonKey(name: 'budget')
  final int budget;
  @JsonKey(name: 'genres')
  final List<Genre> genreList;
  @JsonKey(name: 'homepage')
  final String homepage;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'revenue')
  final int revenue;
  @JsonKey(name: 'runtime')
  final int runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'tagline')
  final String tagLine;
  @JsonKey(name: 'video')
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const MovieDetails(
      {this.adult,
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
      this.voteCount});

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);

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
