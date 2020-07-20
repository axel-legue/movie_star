import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_popular_movies.dart';

import 'delete_rate_movie_test.dart';

void main() {
  GetPopularMovies getPopularMovies;
  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getPopularMovies = GetPopularMovies(mockMovieRepository);
  });

  final tMovies =
      Movies(page: 1, totalPages: 100, totalResults: 1000, movies: []);

  test(
    'should get popular movies from the repository',
    () async {
      // arrange
      when(mockMovieRepository.getPopularMovies()).thenAnswer(
        (realInvocation) async => Right(tMovies),
      );
      // act
      final result = await getPopularMovies(NoParams());
      // assert
      expect(result, Right(tMovies));
    },
  );
}
