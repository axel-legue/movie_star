import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/belongs_to_collection.dart';
import 'package:movie_star/features/movies/domain/entities/genre.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';
import 'package:movie_star/features/movies/domain/entities/production_company.dart';
import 'package:movie_star/features/movies/domain/entities/production_country.dart';
import 'package:movie_star/features/movies/domain/entities/spoken_language.dart';
import 'package:movie_star/features/movies/domain/usecases/get_movies_details.dart';

import 'delete_rate_movie_test.dart';

void main() {
  GetMovieDetails getMovieDetails;
  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMovieDetails = GetMovieDetails(mockMovieRepository);
  });

  final int tId = 1;
  final List<ProductionCompany> tProductionList = [
    ProductionCompany(
      id: 0,
      logoPath: "test",
      name: 'test',
      originCountry: "test",
    )
  ];

  final List<ProductionCountry> tProductionCountryList = [
    ProductionCountry(
      name: "test",
      iso3166: "test",
    )
  ];

  final List<Genre> tGenreList = [
    Genre(
      name: "test",
      id: 0,
    )
  ];

  final List<SpokenLanguage> tSpokenLanguageList = [
    SpokenLanguage(
      name: "test",
      iso639: "test",
    )
  ];
  final tMovieDetails = MovieDetails(
    adult: false,
    title: "test",
    backdropPath: "test",
    belongsToCollection: BelongsToCollection(
        id: 0, name: "test", posterPath: "test", backdropPath: "test"),
    budget: 0,
    genreList: tGenreList,
    homepage: "test",
    id: 0,
    imdbId: "test",
    originalLanguage: "test",
    originalTitle: "test",
    overview: "test",
    popularity: 0.0,
    posterPath: "test",
    productionCompanies: tProductionList,
    productionCountries: tProductionCountryList,
    releaseDate: "test",
    revenue: 0,
    runtime: 0,
    spokenLanguages: tSpokenLanguageList,
    status: "test",
    tagLine: "test",
    video: true,
    voteAverage: 0.0,
    voteCount: 0,
  );

  test(
    'should get details for a movie',
    () async {
      // arrange
      when(mockMovieRepository.getDetailsMovie(any)).thenAnswer(
        (realInvocation) async => Right(tMovieDetails),
      );
      // act
      final result = await getMovieDetails.call(IntParams(id: tId));
      // assert
      expect(result, Right(tMovieDetails));
    },
  );
}
