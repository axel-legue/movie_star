import 'package:equatable/equatable.dart';

import 'movie.dart';

class Movies extends Equatable {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> movies;

  const Movies({this.page, this.totalResults, this.totalPages, this.movies});

  @override
  List<Object> get props => [
        this.page,
        this.totalResults,
        this.totalPages,
        this.movies,
      ];

  @override
  bool get stringify => true;
}
