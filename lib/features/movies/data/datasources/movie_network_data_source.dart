import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';

class MovieNetworkDataSource implements MovieRemoteDataSource {
  //TODO :handle parameters for queries
  final http.Client client;

  MovieNetworkDataSource({@required this.client});

  @override
  Future<MovieDetailsModel> getDetailsMovie(int movieId, [String sessionId]) async{
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getLatestMovies(
      [int movie, String session, String language]) async {
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/latest?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return MovieListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getNowPlayingMovies(
      [int movie, String session, String language]) async{
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return MovieListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getPopularMovies(
      [int movie, String session, String language]) async {
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return MovieListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getTopRatedMovies(
      [int movie, String session, String language]) async {
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return MovieListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getUpcomingMovies(
      [int movie, String session, String language]) async {
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=e1c6b7d663cb0e87c405940a0431592b&language=en-US&page=1',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return MovieListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
