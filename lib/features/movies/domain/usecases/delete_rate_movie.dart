import 'package:dartz/dartz.dart';
import 'package:movie_star/core/entities/response.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_star/features/movies/domain/usecases/post_rate_movie.dart';

class DeleteRateMovie implements UseCase<Response, IntParams>{
  MovieRepository movieRepository;

  DeleteRateMovie(this.movieRepository);

  @override
  Future<Either<Failure, Response>> call(IntParams params) {
   return movieRepository.deleteMovieRate(params.id);
  }
  
}