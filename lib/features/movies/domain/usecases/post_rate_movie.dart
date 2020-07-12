import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_star/core/entities/response.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/repositories/movie_repository.dart';

class PostRateMovie implements UseCase<Response, Params> {
  MovieRepository movieRepository;

  PostRateMovie(this.movieRepository);

  @override
  Future<Either<Failure, Response>> call(Params params) {
    return movieRepository.postRateMovie(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({@required this.id});

  @override
  List<Object> get props => [id];
}
