
import 'package:json_annotation/json_annotation.dart';

part 'app_models.g.dart';

@JsonSerializable()
class MovieRes extends Object{
   bool status;
  String message;
  final List<MovieM> moviesList;

  MovieRes({this.status, this.message , this.moviesList});

  factory MovieRes.fromJson(Map<String, dynamic> json) =>
      _$MovieResFromJson(json);

}
@JsonSerializable()
class MovieM extends Object{

 final int id;
 final int vote_count;
 final int mdb_id;
 final int video;
 final String vote_average;
 final String title;
 final String popularity;
 final String poster_path;
 final String original_title;
 final String backdrop_path;
 final String overview;
 final String release_date;

 MovieM({
   this.id,
   this.vote_count,
   this.mdb_id,
   this.video,
   this.vote_average,
   this.title,
   this.popularity,
   this.poster_path,
   this.original_title,
   this.backdrop_path,
   this.overview,
   this.release_date
 });

 factory MovieM.fromJson(Map<String, dynamic> json) =>
     _$MovieMFromJson(json);



}

