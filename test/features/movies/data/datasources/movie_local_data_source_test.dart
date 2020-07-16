import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/features/movies/data/datasources/movie_local_data_source_impl.dart';
import 'package:movie_star/features/movies/data/models/belongs_to_collection_model.dart';
import 'package:movie_star/features/movies/data/models/genre_model.dart';
import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';
import 'package:movie_star/features/movies/data/models/movie_model.dart';
import 'package:movie_star/features/movies/data/models/production_company_model.dart';
import 'package:movie_star/features/movies/data/models/production_country_model.dart';
import 'package:movie_star/features/movies/data/models/spoken_language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  SharedPreferenceMovieLocalDataSource dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = SharedPreferenceMovieLocalDataSource(
        sharedPreferences: mockSharedPreferences);
  });

  group('getLastPopularMovies', () {
    final tMovieListModel =
        MovieListModel.fromJson(json.decode(fixture('movies.json')));

    test(
      'should return MovieListModel from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('movies.json'));
        // act
        final result = await dataSource.getLastPopularMovies();
        // assert
        verify(mockSharedPreferences.getString(CACHED_POPULAR_MOVIES));
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw CachedException when there is no cached value',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        // Here we store a reference to the function
        final call = dataSource.getLastPopularMovies;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheLastPopularMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    test(
      'should call SharedPreferences to cache the data',
      () async {
        // act
        dataSource.cacheLastPopularMovies(tMovieListModel);
        // assert
        final expectedJsonString = json.encode(tMovieListModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_POPULAR_MOVIES, expectedJsonString));
      },
    );
  });

  group('getLastTopRatedMovies', () {
    final tMovieListModel =
    MovieListModel.fromJson(json.decode(fixture('movies.json')));

    test(
      'should return MovieListModel from SharedPreferences when there is one in the cache',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('movies.json'));
        // act
        final result = await dataSource.getLastTopRatedMovies();
        // assert
        verify(mockSharedPreferences.getString(CACHED_TOP_RATED_MOVIES));
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw CachedException when there is no cached value',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        // Here we store a reference to the function
        final call = dataSource.getLastTopRatedMovies;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheLastTopRatedMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    test(
      'should call SharedPreferences to cache the data',
          () async {
        // act
        dataSource.cacheLastTopRatedMovies(tMovieListModel);
        // assert
        final expectedJsonString = json.encode(tMovieListModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_TOP_RATED_MOVIES, expectedJsonString));
      },
    );
  });

  group('getLastUpcomingMovies', () {
    final tMovieListModel =
    MovieListModel.fromJson(json.decode(fixture('movies.json')));

    test(
      'should return MovieListModel from SharedPreferences when there is one in the cache',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('movies.json'));
        // act
        final result = await dataSource.getLastUpComingMovies();
        // assert
        verify(mockSharedPreferences.getString(CACHED_UPCOMING_MOVIES));
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw CachedException when there is no cached value',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        // Here we store a reference to the function
        final call = dataSource.getLastUpComingMovies;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheLastUpcomingMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    test(
      'should call SharedPreferences to cache the data',
          () async {
        // act
        dataSource.cacheLastUpComingMovies(tMovieListModel);
        // assert
        final expectedJsonString = json.encode(tMovieListModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_UPCOMING_MOVIES, expectedJsonString));
      },
    );
  });

  group('getLastNowPlayingMovies', () {
    final tMovieListModel =
    MovieListModel.fromJson(json.decode(fixture('movies.json')));

    test(
      'should return MovieListModel from SharedPreferences when there is one in the cache',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('movies.json'));
        // act
        final result = await dataSource.getLastNowPlayingMovies();
        // assert
        verify(mockSharedPreferences.getString(CACHED_NOW_PLAYING_MOVIES));
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw CachedException when there is no cached value',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        // Here we store a reference to the function
        final call = dataSource.getLastNowPlayingMovies;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheLastNowPlayingMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    test(
      'should call SharedPreferences to cache the data',
          () async {
        // act
        dataSource.cacheLastNowPlayingMovies(tMovieListModel);
        // assert
        final expectedJsonString = json.encode(tMovieListModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_NOW_PLAYING_MOVIES, expectedJsonString));
      },
    );
  });

  group('getLastLatestMovies', () {
    final tMovieListModel =
    MovieListModel.fromJson(json.decode(fixture('movies.json')));

    test(
      'should return MovieListModel from SharedPreferences when there is one in the cache',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('movies.json'));
        // act
        final result = await dataSource.getLastLatestMovies();
        // assert
        verify(mockSharedPreferences.getString(CACHED_LATEST_MOVIES));
        expect(result, equals(tMovieListModel));
      },
    );

    test(
      'should throw CachedException when there is no cached value',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        // Here we store a reference to the function
        final call = dataSource.getLastLatestMovies;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheLastLatestMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    test(
      'should call SharedPreferences to cache the data',
          () async {
        // act
        dataSource.cacheLastLatestMovies(tMovieListModel);
        // assert
        final expectedJsonString = json.encode(tMovieListModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_LATEST_MOVIES, expectedJsonString));
      },
    );
  });
  //TODO : IMPLEMENT
  group('getLastMovieDetails', () {
    final tMovieDetailsModel =
    MovieDetailsModel.fromJson(json.decode(fixture('movie-details.json')));

    test(
      'should return MovieDetails from SharedPreferences when there is one in the cache',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('movie-details.json'));
        // act
        final result = await dataSource.getLastDetailsMovie();
        // assert
        verify(mockSharedPreferences.getString(CACHED_MOVIE_DETAILS));
        expect(result, equals(tMovieDetailsModel));
      },
    );

    test(
      'should throw CachedException when there is no cached value',
          () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        // Here we store a reference to the function
        final call = dataSource.getLastDetailsMovie;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheLastMovieDetails', () {
    final tMovieDetailsModel = MovieDetailsModel(
      adult: false,
      title: "test",
      backdropPath: "test",
      belongsToCollection: BelongsToCollectionModel(
        id: 0,
        backdropPath: "",
        name: "test",
        posterPath: "",
      ),
      budget: 0,
      genreList: List<GenreModel>(),
      homepage: "",
      id: 0,
      imdbId: "test",
      originalLanguage: "test",
      originalTitle: "test",
      overview: "test",
      popularity: 0.0,
      posterPath: "test",
      productionCompanies: List<ProductionCompanyModel>(),
      productionCountries: List<ProductionCountryModel>(),
      releaseDate: "test",
      revenue: 0,
      runtime: 0,
      spokenLanguages: List<SpokenLanguageModel>(),
      status: "",
      tagLine: "",
      video: true,
      voteAverage: 0.0,
      voteCount: 0,
    );

    test(
      'should call SharedPreferences to cache the data',
          () async {
        // act
        dataSource.cacheLastDetailsMovie(tMovieDetailsModel);
        // assert
        final expectedJsonString = json.encode(tMovieDetailsModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_MOVIE_DETAILS, expectedJsonString));
      },
    );
  });


}
