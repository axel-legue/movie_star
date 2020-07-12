import 'package:dartz/dartz.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, Movies>> execute() async{
    return await repository.getPopularMovies();
  }
}
