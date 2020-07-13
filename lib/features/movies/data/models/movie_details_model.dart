import 'package:json_annotation/json_annotation.dart';
import 'package:movie_star/features/movies/data/models/genre_model.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';

import 'belongs_to_collection_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

part 'movie_details_model.g.dart';

@JsonSerializable(nullable: true)
class MovieDetailsModel extends MovieDetails {
  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollectionModel belongsToCollection;
  @JsonKey(name: 'budget')
  final int budget;
  @JsonKey(name: 'genres')
  final List<GenreModel> genreList;
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
  final List<ProductionCompanyModel> productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountryModel> productionCountries;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'revenue')
  final int revenue;
  @JsonKey(name: 'runtime')
  final int runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageModel> spokenLanguages;
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

  const MovieDetailsModel({
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
  }) : super(
          adult: adult,
          title: title,
          backdropPath: backdropPath,
          belongsToCollection: belongsToCollection,
          budget: budget,
          genreList: genreList,
          homepage: homepage,
          id: id,
          imdbId: imdbId,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          spokenLanguages: spokenLanguages,
          status: status,
          tagLine: tagLine,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
