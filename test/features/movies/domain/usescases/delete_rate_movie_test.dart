import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/entities/response.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/usecases/delete_rate_movie.dart';

import '../repository/mock_movie_repository.dart';

void main() {
  DeleteRateMovie deleteRateMovie;
  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    deleteRateMovie = DeleteRateMovie(mockMovieRepository);
  });

  final int tId = 1;
  final Response tResponse = Response(statusCode: 1, statusMessage: "ok");
  test(
    'should delete rate for a movie',
    () async {
      // arrange
      when(mockMovieRepository.deleteMovieRate(any))
          .thenAnswer((realInvocation) async => Right(tResponse));
      // act
      final result = await deleteRateMovie.call(IntParams(id: tId));
      // assert
      expect(result, Right(tResponse));
    },
  );
}
