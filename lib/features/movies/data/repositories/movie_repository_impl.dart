import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_star/core/entities/response.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/network/network_info.dart';
import 'package:movie_star/features/movies/data/datasources/movie_local_data_source.dart';
import 'package:movie_star/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    @required this.movieRemoteDataSource,
    @required this.movieLocalDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Response>> deleteMovieRate(int movieId,
      [String sessionId]) {
    // TODO: implement deleteMovieRate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MovieDetails>> getDetailsMovie(int movieId,
      [String sessionId]) async {
    if (await networkInfo.isConnected) {
      try {
        final movieDetails =
            await movieRemoteDataSource.getDetailsMovie(movieId);
        movieLocalDataSource.cacheLastDetailsMovie(movieDetails);
        return Right(movieDetails);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localLatestMovieDetails =
            await movieLocalDataSource.getLastDetailsMovie();
        return Right(localLatestMovieDetails);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Movies>> getLatestMovies(
      [int page, String region, String language]) async {
    if (await networkInfo.isConnected) {
      try {
        final latestMovies = await movieRemoteDataSource.getLatestMovies();
        movieLocalDataSource.cacheLastLatestMovies(latestMovies);
        return Right(latestMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localLatestMovies =
            await movieLocalDataSource.getLastLatestMovies();
        return Right(localLatestMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Movies>> getNowPlayingMovies(
      [int page, String region, String language]) async {
    if (await networkInfo.isConnected) {
      try {
        final nowPlayingMovies =
            await movieRemoteDataSource.getNowPlayingMovies();
        movieLocalDataSource.cacheLastNowPlayingMovies(nowPlayingMovies);
        return Right(nowPlayingMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localNowPlayingMovies =
            await movieLocalDataSource.getLastNowPlayingMovies();
        return Right(localNowPlayingMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Movies>> getPopularMovies(
      [int page, String region, String language]) async {
    if (await networkInfo.isConnected) {
      try {
        final popularMovies = await movieRemoteDataSource.getPopularMovies();
        movieLocalDataSource.cacheLastPopularMovies(popularMovies);
        return Right(popularMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPopularMovies =
            await movieLocalDataSource.getLastPopularMovies();
        return Right(localPopularMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Movies>> getTopRatedMovies(
      [int page, String region, String language]) async {
    if (await networkInfo.isConnected) {
      try {
        final topRatedMovies = await movieRemoteDataSource.getTopRatedMovies();
        movieLocalDataSource.cacheLastTopRatedMovies(topRatedMovies);
        return Right(topRatedMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTopRatedMovies =
            await movieLocalDataSource.getLastTopRatedMovies();
        return Right(localTopRatedMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Movies>> getUpComingMovies(
      [int page, String region, String language]) async {
    if (await networkInfo.isConnected) {
      try {
        final upComingMovies = await movieRemoteDataSource.getUpComingMovies();
        movieLocalDataSource.cacheLastUpComingMovies(upComingMovies);
        return Right(upComingMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUpComingMoviesMovies =
            await movieLocalDataSource.getLastUpComingMovies();
        return Right(localUpComingMoviesMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Response>> postRateMovie(int movieId,
      [String sessionId]) {
    // TODO: implement postRateMovie
    throw UnimplementedError();
  }
}
