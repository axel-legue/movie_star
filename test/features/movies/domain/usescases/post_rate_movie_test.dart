import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/entities/response.dart';
import 'package:movie_star/features/movies/domain/usecases/post_rate_movie.dart';

import '../repository/mock_movie_repository.dart';

void main() {
  PostRateMovie rateMovie;
  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    rateMovie = PostRateMovie(mockMovieRepository);
  });

  final int tId = 1;
  final Response tResponse = Response(statusCode: 1, statusMessage: "ok");
  test(
    'should post rate for a movie',
    () async {
      // arrange
      when(mockMovieRepository.postRateMovie(any))
          .thenAnswer((realInvocation) async => Right(tResponse));
      // act
      final result = await rateMovie.call(Params(id: tId));
      // assert
      expect(result, Right(tResponse));
    },
  );
}
