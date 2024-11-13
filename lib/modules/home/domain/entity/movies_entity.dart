class MoviesEntity {
  final String title;
  final String description;
  final String posterUrl;
  final String releaseDate;
  final String duration;
  final double rating;
  final List<CastEntity> cast;

  MoviesEntity(
      {required this.title,
      required this.description,
      required this.posterUrl,
      required this.releaseDate,
      required this.duration,
      required this.rating,
      required this.cast});

  MoviesEntity.empty()
      : title = '',
        description = '',
        posterUrl = '',
        releaseDate = '',
        duration = '',
        rating = 0,
        cast = [];
}

class CastEntity {
  final String actor;
  final String photoUrl;

  CastEntity({
    required this.actor,
    required this.photoUrl,
  });
}
