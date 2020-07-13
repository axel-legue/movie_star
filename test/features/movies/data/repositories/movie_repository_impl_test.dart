import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_star/core/platform/network_info.dart';
import 'package:movie_star/features/movies/data/datasources/movie_local_data_source.dart';
import 'package:movie_star/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_star/features/movies/data/repositories/movie_repository_impl.dart';

class MockRemoteDataSource extends Mock implements MovieRemoteDataSource {}

class MockLocalDataSource extends Mock implements MovieLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MovieRepositoryImpl repositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = MovieRepositoryImpl(
      movieRemoteDataSource: mockRemoteDataSource,
      movieLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
