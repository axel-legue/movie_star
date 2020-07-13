import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';

abstract class MovieLocalDataSource {
  /// Gets the cached [MovieListModel] which was gotten the last time
  /// the use had internet and request the last popular movies
  ///
  /// Throws [CacheDataException] if no cached data is present
  Future<MovieListModel> getLastPopularMovies();

  Future<void> cacheLastPopularMovies(MovieListModel movieListModelToCache);

  /// Gets the cached [MovieListModel] which was gotten the last time
  /// the use had internet and request the last top rated movies
  ///
  /// Throws [CacheDataException] if no cached data is present
  Future<MovieListModel> getLastTopRatedMovies();

  Future<void> cacheLastTopRatedMovies(MovieListModel movieListModelToCache);

  /// Gets the cached [MovieListModel] which was gotten the last time
  /// the use had internet and request the last upcoming movies
  ///
  /// Throws [CacheDataException] if no cached data is present
  Future<MovieListModel> getLastUpComingMovies();

  Future<void> cacheLastUpComingMovies(MovieListModel movieListModelToCache);

  /// Gets the cached [MovieListModel] which was gotten the last time
  /// the use had internet and request the last latest movies
  ///
  /// Throws [CacheDataException] if no cached data is present
  Future<MovieListModel> getLastLatestMovies();

  Future<void> cacheLastLatestMovies(MovieListModel movieListModelToCache);

  /// Gets the cached [MovieListModel] which was gotten the last time
  /// the use had internet and request the last now playing movies
  ///
  /// Throws [CacheDataException] if no cached data is present
  Future<MovieListModel> getLastNowPlayingMovies();

  Future<void> cacheLastNowPlayingMovies(MovieListModel movieListModelToCache);

  /// Gets the cached [MovieDetailsModel] which was gotten the last time
  /// the use had internet and request a details on a movie
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<MovieDetailsModel> getLastDetailsMovie();

  Future<void> cacheLastDetailsMovie(
      MovieDetailsModel movieDetailsModelToCache);
}
