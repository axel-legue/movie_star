import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_latest_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_movies_details.dart';
import 'package:movie_star/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_upcoming_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetLatestMovies getLatestMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetUpComingMovies getUpComingMovies;
  final GetMovieDetails getMovieDetails;

  MovieBloc({
    @required this.getLatestMovies,
    @required this.getPopularMovies,
    @required this.getTopRatedMovies,
    @required this.getNowPlayingMovies,
    @required this.getUpComingMovies,
    @required this.getMovieDetails,
  })  : assert(getLatestMovies != null),
        assert(getPopularMovies != null),
        assert(getTopRatedMovies != null),
        assert(getNowPlayingMovies != null),
        assert(getUpComingMovies != null),
        assert(getMovieDetails != null),
        super(Empty());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is GetPopularMoviesEvent) {
      yield LoadingState();
      final failureOrMovies = await getPopularMovies(NoParams());

      yield failureOrMovies.fold(
        (failure) => ErrorState(message: _mapFailureToMessage(failure)),
        (movies) => LoadedMovies(movies: movies),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
