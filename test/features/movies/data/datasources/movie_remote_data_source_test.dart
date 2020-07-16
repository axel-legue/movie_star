import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/features/movies/data/datasources/movie_network_data_source.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';
import 'package:movie_star/features/movies/data/models/movie_model.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MovieNetworkDataSource dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MovieNetworkDataSource(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200(String fixtureName) {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(
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
        .thenAnswer((_) async => http.Response(
              'Something  went wrong',
              404,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              },
            ));
  }

  group('getPopularMovies', () {
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
}
