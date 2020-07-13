import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_star/features/movies/data/models/belongs_to_collection_model.dart';
import 'package:movie_star/features/movies/data/models/genre_model.dart';
import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/production_company_model.dart';
import 'package:movie_star/features/movies/data/models/production_country_model.dart';
import 'package:movie_star/features/movies/data/models/spoken_language_model.dart';

import '../../../../core/fixtures/fixture_reader.dart';

void main() {
  final List<ProductionCompanyModel> tProductionModelList = [
    ProductionCompanyModel(
      id: 0,
      logoPath: "test",
      name: 'test',
      originCountry: "test",
    )
  ];

  final List<ProductionCountryModel> tProductionCountryModelList = [
    ProductionCountryModel(
      name: "test",
      iso3166: "test",
    )
  ];

  final List<GenreModel> tGenreModelList = [
    GenreModel(
      name: "test",
      id: 0,
    )
  ];

  final List<SpokenLanguageModel> tSpokenLanguageModelList = [
    SpokenLanguageModel(
      name: "test",
      iso639: "test",
    )
  ];

  final tMovieDetailsModel = MovieDetailsModel(
    adult: false,
    title: "test",
    backdropPath: "test",
    belongsToCollection: BelongsToCollectionModel(
        id: 0, name: "test", posterPath: "test", backdropPath: "test"),
    budget: 0,
    genreList: tGenreModelList,
    homepage: "test",
    id: 0,
    imdbId: "test",
    originalLanguage: "test",
    originalTitle: "test",
    overview: "test",
    popularity: 0.0,
    posterPath: "test",
    productionCompanies: tProductionModelList,
    productionCountries: tProductionCountryModelList,
    releaseDate: "test",
    revenue: 0,
    runtime: 0,
    spokenLanguages: tSpokenLanguageModelList,
    status: "test",
    tagLine: "test",
    video: true,
    voteAverage: 0.0,
    voteCount: 0,
  );

  test(
    'should be a subclass of Movie  entity',
    () async {
      // assert
      expect(tMovieDetailsModel, isA<MovieDetailsModel>());
    },
  );
  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('movie-details.json'));
        // act
        final result = MovieDetailsModel.fromJson(jsonMap);
        // assert
        expect(result, tMovieDetailsModel);
      },
    );
  });

  // TODO("implement toJson()test ")
  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tMovieDetailsModel.toJson();
        // assert
      },
    );
  });
}
