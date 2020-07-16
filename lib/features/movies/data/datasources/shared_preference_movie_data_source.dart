import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_star/core/error/exceptions.dart';
import 'package:movie_star/features/movies/data/datasources/movie_local_data_source.dart';
import 'package:movie_star/features/movies/data/models/movie_details_model.dart';
import 'package:movie_star/features/movies/data/models/movie_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_POPULAR_MOVIES = 'CACHED_POPULAR_MOVIES';
const CACHED_TOP_RATED_MOVIES = 'CACHED_TOP_RATED_MOVIES';
const CACHED_LATEST_MOVIES = 'CACHED_LATEST_MOVIES';
const CACHED_NOW_PLAYING_MOVIES = 'CACHED_NOW_PLAYING_MOVIES';
const CACHED_UPCOMING_MOVIES = 'CACHED_UPCOMING_MOVIES';
const CACHED_MOVIE_DETAILS = 'CACHED_MOVIE_DETAILS';

class SharedPreferenceMovieLocalDataSource implements MovieLocalDataSource {
  SharedPreferences sharedPreferences;

  SharedPreferenceMovieLocalDataSource({@required this.sharedPreferences});

  @override
  Future<void> cacheLastDetailsMovie(MovieDetailsModel movieDetailsModel) {
    return sharedPreferences.setString(
      CACHED_MOVIE_DETAILS,
      json.encode(movieDetailsModel.toJson()),
    );
  }

  @override
  Future<void> cacheLastLatestMovies(MovieListModel movieListModel) {
    return sharedPreferences.setString(
      CACHED_LATEST_MOVIES,
      json.encode(movieListModel.toJson()),
    );
  }

  @override
  Future<void> cacheLastNowPlayingMovies(MovieListModel movieListModel) {
    return sharedPreferences.setString(
      CACHED_NOW_PLAYING_MOVIES,
      json.encode(movieListModel.toJson()),
    );
  }

  @override
  Future<void> cacheLastPopularMovies(MovieListModel movieListModel) {
    return sharedPreferences.setString(
      CACHED_POPULAR_MOVIES,
      json.encode(movieListModel.toJson()),
    );
  }

  @override
  Future<void> cacheLastTopRatedMovies(MovieListModel movieListModel) {
    return sharedPreferences.setString(
      CACHED_TOP_RATED_MOVIES,
      json.encode(movieListModel.toJson()),
    );
  }

  @override
  Future<void> cacheLastUpComingMovies(MovieListModel movieListModel) {
    return sharedPreferences.setString(
      CACHED_UPCOMING_MOVIES,
      json.encode(movieListModel.toJson()),
    );
  }

  @override
  Future<MovieDetailsModel> getLastDetailsMovie() {
    final jsonString = sharedPreferences.getString(CACHED_MOVIE_DETAILS);
    if (jsonString != null) {
      return Future.value(MovieDetailsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<MovieListModel> getLastLatestMovies() {
    final jsonString = sharedPreferences.getString(CACHED_LATEST_MOVIES);
    if (jsonString != null) {
      return Future.value(MovieListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<MovieListModel> getLastNowPlayingMovies() {
    final jsonString = sharedPreferences.getString(CACHED_NOW_PLAYING_MOVIES);
    if (jsonString != null) {
      return Future.value(MovieListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<MovieListModel> getLastPopularMovies() {
    final jsonString = sharedPreferences.getString(CACHED_POPULAR_MOVIES);
    if (jsonString != null) {
      return Future.value(MovieListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<MovieListModel> getLastTopRatedMovies() {
    final jsonString = sharedPreferences.getString(CACHED_TOP_RATED_MOVIES);
    if (jsonString != null) {
      return Future.value(MovieListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<MovieListModel> getLastUpComingMovies() {
    final jsonString = sharedPreferences.getString(CACHED_UPCOMING_MOVIES);
    if (jsonString != null) {
      return Future.value(MovieListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
