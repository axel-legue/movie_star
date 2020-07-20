import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/error/failures.dart';
import 'package:movie_star/core/usecases/use_case.dart';
import 'package:movie_star/features/movies/domain/entities/movie.dart';
import 'package:movie_star/features/movies/domain/entities/movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_latest_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_movies_details.dart';
import 'package:movie_star/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_star/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:movie_star/features/movies/presentation/movie_bloc.dart';

class MockGetLatestMovies extends Mock implements GetLatestMovies {}

class MockGetPopularMovies extends Mock implements GetPopularMovies {}

class MockGetTopRatedMovies extends Mock implements GetTopRatedMovies {}

class MockGetNowPlayingMovies extends Mock implements GetNowPlayingMovies {}

class MockGetUpComingMovies extends Mock implements GetUpComingMovies {}

class MockGetMovieDetails extends Mock implements GetMovieDetails {}

void main() {
  MovieBloc bloc;
  MockGetLatestMovies mockGetLatestMovies;
  MockGetPopularMovies mockGetPopularMovies;
  MockGetTopRatedMovies mockGetTopRatedMovies;
  MockGetNowPlayingMovies mockGetNowPlayingMovies;
  MockGetUpComingMovies mockGetUpComingMovies;
  MockGetMovieDetails mockGetMovieDetails;

  setUp(() {
    mockGetLatestMovies = MockGetLatestMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetUpComingMovies = MockGetUpComingMovies();
    mockGetMovieDetails = MockGetMovieDetails();

    bloc = MovieBloc(
        getLatestMovies: mockGetLatestMovies,
        getMovieDetails: mockGetMovieDetails,
        getNowPlayingMovies: mockGetNowPlayingMovies,
        getPopularMovies: mockGetPopularMovies,
        getTopRatedMovies: mockGetTopRatedMovies,
        getUpComingMovies: mockGetUpComingMovies);
  });

  test(
    'initialState should be Empty',
    () {
      expect(bloc.state, equals(Empty()));
    },
  );

  // TODO('add Test for GetTopRatedMoviesEvent, GetLatestMoviesEvent, GetNowPlayingMoviesEvent, GetUpcomingMoviesEvent, GetMovieDetailsEvent ')

  group('GetPopularMoviesEvent', () {
    final tMovies = Movies(
      page: 0,
      totalResults: 0,
      totalPages: 0,
      movies: List<Movie>(),
    );

    test(
      'should get data from the get popular movie use case',
      () async {
        // arrange
        when(mockGetPopularMovies(any)).thenAnswer((_) async => Right(tMovies));
        // act
        bloc.add(GetPopularMoviesEvent());
        await untilCalled(mockGetPopularMovies(any));
        // assert
        verify(mockGetPopularMovies(NoParams()));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetPopularMovies(any)).thenAnswer((_) async => Right(tMovies));
        // assert later
        final expected = [
          Empty(),
          LoadingState(),
          LoadedMovies(movies: tMovies)
        ];

        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetPopularMoviesEvent());
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        when(mockGetPopularMovies(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          LoadingState(),
          ErrorState(message: SERVER_FAILURE_MESSAGE)
        ];

        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetPopularMoviesEvent());
      },
    );

    test(
      'should emit [Loading, Error] with proper message for the error when getting data fails',
      () async {
        // arrange
        when(mockGetPopularMovies(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          LoadingState(),
          ErrorState(message: CACHE_FAILURE_MESSAGE)
        ];

        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetPopularMoviesEvent());
      },
    );
  });
}
