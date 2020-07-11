// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) {
  return Movies(
    page: json['page'] as int,
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
    movies: (json['results'] as List)
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.movies,
    };
