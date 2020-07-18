import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';

abstract class MovieRemoteDataSource {
  /// Calls the https://api.themoviedb.org/3/movie/popular?api_key={api_key}&language={language}&page={pageNumber}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieListModel> getPopularMovies(
      [int page, String region, String language]);

  /// Calls the https://api.themoviedb.org/3/movie/top_rated?api_key={api_key}&language={language}&page={pageNumber}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieListModel> getTopRatedMovies(
      [int page, String region, String language]);

  /// Calls the https://api.themoviedb.org/3/movie/upcoming?api_key={api_key}&language={language}&page={pageNumber}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieListModel> getUpcomingMovies(
      [int page, String region, String language]);

  /// Calls the https://api.themoviedb.org/3/movie/latest?api_key={api_key}&language={language}&page={pageNumber}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieListModel> getLatestMovies(
      [int page, String region, String language]);

  /// Calls the https://api.themoviedb.org/3/movie/now_playing?api_key={api_key}&language={language}&page={pageNumber}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieListModel> getNowPlayingMovies(
      [int page, String region, String language]);

  /// https://api.themoviedb.org/3/movie/{movie_id}?api_key={api__key}&language={language}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieDetailsModel> getDetailsMovie(int movieId, [String sessionId]);

//TODO : See if we should create a ResponseModel  for post and delete
//  Future<Response> postRateMovie(int movieId,
//      [String sessionId]);
//
//  Future<Response> deleteMovieRate(int movieId,
//      [String sessionId]);
}
