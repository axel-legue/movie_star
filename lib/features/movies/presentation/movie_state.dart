part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class Empty extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadedMovies extends MovieState {
  final Movies movies;

  LoadedMovies({@required this.movies});

  @override
  List<Object> get props => [this.movies];
}

class LoadedDetailsMovie extends MovieState {
  final MovieDetails movieDetails;

  LoadedDetailsMovie({@required this.movieDetails});

  @override
  List<Object> get props => [this.movieDetails];
}

class ErrorState extends MovieState {
  final String message;

  ErrorState({@required this.message});

  @override
  List<Object> get props => [this.message];
}
