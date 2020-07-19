part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetPopularMovies extends MovieEvent {
  GetPopularMovies();

  @override
  List<Object> get props => [];
}

class GetTopRatedMovies extends MovieEvent {
  GetTopRatedMovies();

  @override
  List<Object> get props => [];
}

class GetLatestMovies extends MovieEvent {
  GetLatestMovies();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovies extends MovieEvent {
  GetNowPlayingMovies();

  @override
  List<Object> get props => [];
}

class GetUpcomingMovies extends MovieEvent {
  GetUpcomingMovies();

  @override
  List<Object> get props => [];
}

class GetMovieDetails extends MovieEvent {
  final int idMovie;

  GetMovieDetails(this.idMovie);

  @override
  List<Object> get props => [this.idMovie];
}
