import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  MoviesModel({
    required super.title,
    required super.description,
    required super.posterUrl,
    required super.releaseDate,
    required super.duration,
    required super.rating,
    required super.cast,
  });
  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      posterUrl: json['posterUrl'] ?? '',
      releaseDate: json['releaseDate'] ?? '',
      duration: json['duration'] ?? 0,
      rating: json['rating'] ?? 0,
      cast: json['cast'] != null
          ? (json['cast'] as List).map((e) => CastModel.fromJson(e)).toList()
          : [],
    );
  }
}

class CastModel extends CastEntity {
  CastModel({
    required super.actor,
    required super.photoUrl,
  });
  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      actor: json['actor'],
      photoUrl: json['photo_url'],
    );
  }
}
