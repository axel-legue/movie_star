part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetPopularMoviesEvent extends MovieEvent {
  GetPopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEvent extends MovieEvent {
  GetTopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetLatestMoviesEvent extends MovieEvent {
  GetLatestMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MovieEvent {
  GetNowPlayingMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetUpcomingMoviesEvent extends MovieEvent {
  GetUpcomingMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieEvent {
  final int idMovie;

  GetMovieDetailsEvent(this.idMovie);

  @override
  List<Object> get props => [this.idMovie];
}
