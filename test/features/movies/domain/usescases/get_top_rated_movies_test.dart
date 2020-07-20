import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_top_rated_movies.dart';

import 'delete_rate_movie_test.dart';

void main() {
  GetTopRatedMovies getTopRatedMovies;
  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getTopRatedMovies = GetTopRatedMovies(mockMovieRepository);
  });

  final tMovies =
      Movies(page: 1, totalPages: 100, totalResults: 1000, movies: []);

  test(
    'should get top rated movies from the repository',
    () async {
      // arrange
      when(mockMovieRepository.getTopRatedMovies()).thenAnswer(
        (realInvocation) async => Right(tMovies),
      );
      // act
      final result = await getTopRatedMovies(NoParams());
      // assert
      expect(result, Right(tMovies));
    },
  );
}
