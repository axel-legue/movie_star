// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) {
  return MovieDetails(
    adult: json['adult'] as bool,
    title: json['title'] as String,
    backdropPath: json['backdrop_path'] as String,
    belongsToCollection: BelongsToCollection.fromJson(
        json['belongs_to_collection'] as Map<String, dynamic>),
    budget: json['budget'] as int,
    genreList: (json['genres'] as List)
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
    homepage: json['homepage'] as String,
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    posterPath: json['poster_path'] as String,
    productionCompanies: (json['production_companies'] as List)
        .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
        .toList(),
    productionCountries: (json['production_countries'] as List)
        .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
        .toList(),
    releaseDate: json['release_date'] as String,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    spokenLanguages: (json['spoken_languages'] as List)
        .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String,
    tagLine: json['tagline'] as String,
    video: json['video'] as bool,
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genreList,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'title': instance.title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagLine,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
