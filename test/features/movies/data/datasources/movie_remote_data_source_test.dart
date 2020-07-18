import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/features/movies/data/datasources/movie_network_data_source.dart';
import 'package:movie_star/features/movies/data/models/belongs_to_collection_model.dart';
import 'package:movie_star/features/movies/data/models/genre_model.dart';
import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';
import 'package:movie_star/features/movies/data/models/movie_model.dart';
import 'package:movie_star/features/movies/data/models/production_company_model.dart';
import 'package:movie_star/features/movies/data/models/production_country_model.dart';
import 'package:movie_star/features/movies/data/models/spoken_language_model.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {

  MovieNetworkDataSource dataSource;
  MockHttpClient mockHttpClient;

  final tMovieListModel = MovieListModel(
    page: 0,
    totalResults: 0,
    totalPages: 0,
    movies: [
      MovieModel(
        popularity: 0.0,
        voteCount: 0,
        video: true,
        posterPath: "test",
        id: 0,
        adult: false,
        backdropPath: "test",
        originalLanguage: "test",
        originalTitle: "test",
        genreIds: [0],
        title: "test",
        voteAverage: 0.0,
        overview: "test",
        releaseDate: "test",
      ),
      MovieModel(
        popularity: 0.0,
        voteCount: 0,
        video: true,
        posterPath: "test",
        id: 1,
        adult: false,
        backdropPath: "test",
        originalLanguage: "test",
        originalTitle: "test",
        genreIds: [0],
        title: "test",
        voteAverage: 0.0,
        overview: "test",
        releaseDate: "test",
      ),
    ],
  );

  final tMovieDetailsModel = MovieDetailsModel(
    adult:false,
    title: "test",
    backdropPath: "test",
    belongsToCollection: BelongsToCollectionModel(
        id: 0,
        name: "test",
        posterPath: "test",
        backdropPath: "test"
    ),
    budget: 0,
    genreList: [GenreModel(
        id: 1,
        name: "test"
    )
    ],
    homepage: "test",
    id: 0,
    imdbId: "test",
    originalLanguage: "test",
    originalTitle: "test",
    overview: "test",
    popularity: 0.0,
    posterPath: "test",
    productionCompanies: [ProductionCompanyModel(
        id: 0,
        logoPath: "test",
        name: "test",
        originCountry: "test"
    )
    ],
    productionCountries: [ProductionCountryModel(
        iso3166: "test",
        name: "test"
    )
    ],
    releaseDate: "test",
    revenue: 0,
    runtime: 0,
    spokenLanguages: [SpokenLanguageModel(
        iso639: "test",
        name: "test"
    )
    ],
    status: "test",
    tagLine: "test",
    video: true,
    voteAverage: 0.0,
    voteCount: 0,
  );

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MovieNetworkDataSource(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200(String fixtureName) {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async =>
        http.Response(
          fixture(fixtureName),
          200,
          headers: {
            HttpHeaders.contentTypeHeader:
            'application/json; charset=utf-8',
          },
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async =>
        http.Response(
          'Something  went wrong',
          404,
          headers: {
            HttpHeaders.contentTypeHeader:
            'application/json; charset=utf-8',
          },
        ));
  }

  group('getPopularMovies', () {
    test(
      'should perform a GET request on an url and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        dataSource.getPopularMovies();
        // assert
        verify(mockHttpClient.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return MovieListModel when the response is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        final result = await dataSource.getPopularMovies();
        // assert
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw ServerException when the response is different from 200 (unsuccess)',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getPopularMovies;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getTopRatedMovies', () {
    test(
      'should perform a GET request on an url and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        dataSource.getTopRatedMovies();
        // assert
        verify(mockHttpClient.get(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return MovieListModel when the response is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        final result = await dataSource.getTopRatedMovies();
        // assert
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw ServerException when the response is different from 200 (unsuccess)',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getTopRatedMovies;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getNowPlayingMovies', () {
    test(
      'should perform a GET request on an url and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        dataSource.getNowPlayingMovies();
        // assert
        verify(mockHttpClient.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return MovieListModel when the response is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        final result = await dataSource.getNowPlayingMovies();
        // assert
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw ServerException when the response is different from 200 (unsuccess)',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getNowPlayingMovies;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getLatestMovies', () {
    test(
      'should perform a GET request on an url and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        dataSource.getLatestMovies();
        // assert
        verify(mockHttpClient.get(
          'https://api.themoviedb.org/3/movie/latest?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return MovieListModel when the response is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        final result = await dataSource.getLatestMovies();
        // assert
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw ServerException when the response is different from 200 (unsuccess)',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getLatestMovies;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getUpcomingMovies', () {
    test(
      'should perform a GET request on an url and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        dataSource.getUpcomingMovies();
        // assert
        verify(mockHttpClient.get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return MovieListModel when the response is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movies.json');
        // act
        final result = await dataSource.getUpcomingMovies();
        // assert
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw ServerException when the response is different from 200 (unsuccess)',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getUpcomingMovies;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getDetailsMovie', () {
    final tIdMovie = 1;

    test(
      'should perform a GET request on an url and with application/json header',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movie-details.json');
        // act
        dataSource.getDetailsMovie(tIdMovie);
        // assert
        verify(mockHttpClient.get(
          'https://api.themoviedb.org/3/movie/1?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US',
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return MovieListModel when the response is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200('movie-details.json');
        // act
        final result = await dataSource.getDetailsMovie(tIdMovie);
        // assert
        expect(result, equals(tMovieDetailsModel));
      },
    );

    test(
      'should throw ServerException when the response is different from 200 (unsuccess)',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getDetailsMovie;
        // assert
        expect(() => call(tIdMovie), throwsA(isA<ServerException>()));
      },
    );
  });
}
