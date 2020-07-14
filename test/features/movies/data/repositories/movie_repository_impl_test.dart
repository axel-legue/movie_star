import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/platform/network_info.dart';
import 'package:movie_star/features/movies/data/datasources/movie_local_data_source.dart';
import 'package:movie_star/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_star/features/movies/data/models/belongs_to_collection_model.dart';
import 'package:movie_star/features/movies/data/models/genre_model.dart';
import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';
import 'package:movie_star/features/movies/data/models/movie_model.dart';
import 'package:movie_star/features/movies/data/models/production_company_model.dart';
import 'package:movie_star/features/movies/data/models/production_country_model.dart';
import 'package:movie_star/features/movies/data/models/spoken_language_model.dart';
import 'package:movie_star/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';

class MockRemoteDataSource extends Mock implements MovieRemoteDataSource {}

class MockLocalDataSource extends Mock implements MovieLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MovieRepositoryImpl repositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = MovieRepositoryImpl(
      movieRemoteDataSource: mockRemoteDataSource,
      movieLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should check if the device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          // act
          repositoryImpl.getUpComingMovies();
          // assert
          verify(mockNetworkInfo.isConnected);
        },
      );

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getTopRatedMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    final Movies tMovies = tMovieListModel;

    final ServerFailure tServerFailure = ServerFailure();
    final CacheFailure tCacheFailure = CacheFailure();

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTopRatedMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getTopRatedMovies();
          // assert
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTopRatedMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          await repositoryImpl.getTopRatedMovies();
          // assert
          verify(mockLocalDataSource.cacheLastTopRatedMovies(tMovieListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTopRatedMovies())
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getTopRatedMovies();
          // assert
          verify(mockRemoteDataSource.getTopRatedMovies());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(tServerFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastTopRatedMovies())
              .thenAnswer((realInvocation) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getTopRatedMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastTopRatedMovies());
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should return CacheFailure  when the is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastTopRatedMovies())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getTopRatedMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastTopRatedMovies());
          expect(result, equals(Left(tCacheFailure)));
        },
      );
    });
  });
  group('getPopularMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    final Movies tMovies = tMovieListModel;

    final ServerFailure tServerFailure = ServerFailure();
    final CacheFailure tCacheFailure = CacheFailure();

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPopularMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getPopularMovies();
          // assert
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPopularMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          await repositoryImpl.getPopularMovies();
          // assert
          verify(mockLocalDataSource.cacheLastPopularMovies(tMovieListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPopularMovies())
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getPopularMovies();
          // assert
          verify(mockRemoteDataSource.getPopularMovies());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(tServerFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastPopularMovies())
              .thenAnswer((realInvocation) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getPopularMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastPopularMovies());
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should return CacheFailure  when the is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastPopularMovies())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getPopularMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastPopularMovies());
          expect(result, equals(Left(tCacheFailure)));
        },
      );
    });
  });
  group('getNowPlayingMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    final Movies tMovies = tMovieListModel;

    final ServerFailure tServerFailure = ServerFailure();
    final CacheFailure tCacheFailure = CacheFailure();

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getNowPlayingMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getNowPlayingMovies();
          // assert
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getNowPlayingMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          await repositoryImpl.getNowPlayingMovies();
          // assert
          verify(
              mockLocalDataSource.cacheLastNowPlayingMovies(tMovieListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getNowPlayingMovies())
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getNowPlayingMovies();
          // assert
          verify(mockRemoteDataSource.getNowPlayingMovies());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(tServerFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastNowPlayingMovies())
              .thenAnswer((realInvocation) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getNowPlayingMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastNowPlayingMovies());
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should return CacheFailure  when the is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastNowPlayingMovies())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getNowPlayingMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastNowPlayingMovies());
          expect(result, equals(Left(tCacheFailure)));
        },
      );
    });
  });
  group('getLatestMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    final Movies tMovies = tMovieListModel;

    final ServerFailure tServerFailure = ServerFailure();
    final CacheFailure tCacheFailure = CacheFailure();

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getLatestMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getLatestMovies();
          // assert
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getLatestMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          await repositoryImpl.getLatestMovies();
          // assert
          verify(mockLocalDataSource.cacheLastLatestMovies(tMovieListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getLatestMovies())
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getLatestMovies();
          // assert
          verify(mockRemoteDataSource.getLatestMovies());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(tServerFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastLatestMovies())
              .thenAnswer((realInvocation) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getLatestMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastLatestMovies());
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should return CacheFailure  when the is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastLatestMovies())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getLatestMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastLatestMovies());
          expect(result, equals(Left(tCacheFailure)));
        },
      );
    });
  });
  group('getUpComingMovies', () {
    final tMovieListModel = MovieListModel(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<MovieModel>(),
    );

    final Movies tMovies = tMovieListModel;

    final ServerFailure tServerFailure = ServerFailure();
    final CacheFailure tCacheFailure = CacheFailure();

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getUpComingMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getUpComingMovies();
          // assert
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getUpComingMovies())
              .thenAnswer((_) async => tMovieListModel);
          // act
          await repositoryImpl.getUpComingMovies();
          // assert
          verify(mockLocalDataSource.cacheLastUpComingMovies(tMovieListModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getUpComingMovies())
              .thenThrow(ServerException());
          // act
          final result = await repositoryImpl.getUpComingMovies();
          // assert
          verify(mockRemoteDataSource.getUpComingMovies());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(tServerFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastUpComingMovies())
              .thenAnswer((realInvocation) async => tMovieListModel);
          // act
          final result = await repositoryImpl.getUpComingMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastUpComingMovies());
          expect(result, equals(Right(tMovies)));
        },
      );

      test(
        'should return CacheFailure  when the is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastUpComingMovies())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getUpComingMovies();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastUpComingMovies());
          expect(result, equals(Left(tCacheFailure)));
        },
      );
    });
  });

  group('getDetailsMovie', () {
    final int tMovieId = 0;
    final MovieDetailsModel tMovieDetailsModel = MovieDetailsModel(
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
    final MovieDetails tMovieDetails = tMovieDetailsModel;

    final ServerFailure tServerFailure = ServerFailure();
    final CacheFailure tCacheFailure = CacheFailure();

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getDetailsMovie(tMovieId))
              .thenAnswer((_) async => tMovieDetailsModel);
          // act
          final result = await repositoryImpl.getDetailsMovie(tMovieId);
          // assert
          expect(result, equals(Right(tMovieDetails)));
        },
      );

      test(
        'should cache data locally  when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getDetailsMovie(tMovieId))
              .thenAnswer((_) async => tMovieDetailsModel);
          // act
          final result = await repositoryImpl.getDetailsMovie(tMovieId);
          // assert
          verify(mockLocalDataSource.cacheLastDetailsMovie(tMovieDetailsModel));
        },
      );

      test(
        'should return ServerFailure  when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getDetailsMovie(tMovieId))
              .thenThrow(tServerFailure);
          // act
          final result = await repositoryImpl.getDetailsMovie(tMovieId);
          // assert
          verify(mockRemoteDataSource.getDetailsMovie(tMovieId));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, Left(tServerFailure));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cache data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastDetailsMovie())
              .thenAnswer((realInvocation) async => tMovieDetailsModel);
          // act
          final result = await repositoryImpl.getDetailsMovie(tMovieId);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastDetailsMovie());
          expect(result, equals(Right(tMovieDetails)));
        },
      );

      test(
        'should return CacheFailure  when the is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastDetailsMovie())
              .thenThrow(CacheException());
          // act
          final result = await repositoryImpl.getDetailsMovie(tMovieId);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastDetailsMovie());
          expect(result, equals(Left(tCacheFailure)));
        },
      );
    });
  });
  //TODO('add tests for  postRateMovie() ,deleteRateMovie() when User Authentication will be implemented')
}
