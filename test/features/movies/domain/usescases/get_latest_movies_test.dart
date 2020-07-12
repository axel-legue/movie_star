import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_latest_movies.dart';

import '../repository/mock_movie_repository.dart';

void main() {
  GetLatestMovies getLatestMovies;
  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getLatestMovies = GetLatestMovies(mockMovieRepository);
  });

  final tMovies =
      Movies(page: 1, totalPages: 100, totalResults: 1000, movies: []);

  test(
    'should get latest movies from the repository',
    () async {
      // arrange
      when(mockMovieRepository.getLatestMovies()).thenAnswer(
        (realInvocation) async => Right(tMovies),
      );
      // act
      final result = await getLatestMovies(NoParams());
      // assert
      expect(result, Right(tMovies));
    },
  );
}
