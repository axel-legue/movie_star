import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_star/core/entities/response.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/platform/network_info.dart';
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
      [String sessionId]) {
    // TODO: implement getDetailsMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movies>> getLatestMovies(
      [int page, String region, String language]) {
    // TODO: implement getLatestMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movies>> getNowPlayingMovies(
      [int page, String region, String language]) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movies>> getPopularMovies(
      [int page, String region, String language]) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movies>> getTopRatedMovies(
      [int page, String region, String language]) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movies>> getUpComingMovies(
      [int page, String region, String language]) {
    // TODO: implement getUpComingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> postRateMovie(int movieId,
      [String sessionId]) {
    // TODO: implement postRateMovie
    throw UnimplementedError();
  }
}
