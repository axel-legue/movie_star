// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String,
    posterPath: json['poster_path'] as String,
    id: json['id'] as int,
    originalLanguage: json['original_language'] as String,
    title: json['title'] as String,
    originalTitle: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    releaseDate: json['release_date'] as String,
    video: json['video'] as bool,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
    };
