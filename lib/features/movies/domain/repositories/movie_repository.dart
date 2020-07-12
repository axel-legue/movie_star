import 'package:dartz/dartz.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movies>> getPopularMovies(
      [int page, String region, String language]);

  Future<Either<Failure, Movies>> getTopRatedMovies(
      [int page, String region, String language]);

  Future<Either<Failure, Movies>> getUpComingMovies(
      [int page, String region, String language]);

  Future<Either<Failure, Movies>> getLatestMovies(
      [int page, String region, String language]);

  Future<Either<Failure, Movies>> getNowPlayingMovies(
      [int page, String region, String language]);
// TODO replace Movies on the right Side should be a void
//  Future<Either<Failure,Movies>>rateMovie(int movieId, [String sessionId]);
//  Future<Either<Failure,Movies>>deleteMovieRate(int movieId, [String sessionId]);

}
