import 'package:dartz/dartz.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movie_details.dart';
import 'package:movie_star/features/movies/domain/repositories/movie_repository.dart';

class GetMovieDetails implements UseCase<MovieDetails, IntParams> {
  MovieRepository movieRepository;

  GetMovieDetails(this.movieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(IntParams params) {
    return movieRepository.getDetailsMovie(params.id);
  }
}
