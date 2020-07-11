import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'features/movies/domain/entities/movie_details.dart';
//TODO("To be removed when all models are tested")
Future<String> _loadASMovieAsset() async {
  return await rootBundle.loadString('assets/movie.json');
}


Future loadMovie() async {
  String jsonString = await _loadASMovieAsset();
  final jsonResponse = json.decode(jsonString);
  MovieDetails movie = new MovieDetails.fromJson(jsonResponse);
  print(movie);
}