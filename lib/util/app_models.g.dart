// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRes _$MovieResFromJson(Map<String, dynamic> json) {
  return MovieRes(
      status: json['status'] as bool,
      message: json['message'] as String,
      moviesList: (json['moviesList'] as List)
          ?.map((e) =>
              e == null ? null : MovieM.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MovieResToJson(MovieRes instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'moviesList': instance.moviesList
    };

MovieM _$MovieMFromJson(Map<String, dynamic> json) {
  return MovieM(
      id: json['id'] as int,
      vote_count: json['vote_count'] as int,
      mdb_id: json['mdb_id'] as int,
      video: json['video'] as int,
      vote_average: json['vote_average'] as String,
      title: json['title'] as String,
      popularity: json['popularity'] as String,
      poster_path: json['poster_path'] as String,
      original_title: json['original_title'] as String,
      backdrop_path: json['backdrop_path'] as String,
      overview: json['overview'] as String,
      release_date: json['release_date'] as String);
}

Map<String, dynamic> _$MovieMToJson(MovieM instance) => <String, dynamic>{
      'id': instance.id,
      'vote_count': instance.vote_count,
      'mdb_id': instance.mdb_id,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'title': instance.title,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'original_title': instance.original_title,
      'backdrop_path': instance.backdrop_path,
      'overview': instance.overview,
      'release_date': instance.release_date
    };
