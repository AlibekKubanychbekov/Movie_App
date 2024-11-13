import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  final MoviesEntity moviesEntity;
  const MovieDetailsScreen({
    required this.moviesEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.network(moviesEntity.posterUrl),
        ],
      ),
    );
  }
}
