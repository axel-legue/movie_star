import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(Empty());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
