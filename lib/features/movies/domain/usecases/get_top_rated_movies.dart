import 'package:dartz/dartz.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/repositories/movie_repository.dart';

class GetTopRatedMovies implements UseCase<Movies, NoParams> {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, Movies>> call(NoParams params) async {
    return await repository.getTopRatedMovies();
  }
}
