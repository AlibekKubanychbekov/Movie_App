import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';
import 'package:movie_app/core/extension/int_extension.dart';
import 'package:movie_app/core/mixin/date_time_mixin.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorite_movies_bloc.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_event.dart';
import 'package:movie_app/modules/home/features/home/widget/movie_details_bg.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget with DateTimeMixin {
  final MoviesEntity moviesEntity;
  const MovieDetailsScreen({
    required this.moviesEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          MovieDeetailsBg(
            posterUrl: moviesEntity.posterUrl,
          ),
          Positioned(
            top: 50,
            left: 10,
            child: BackButton(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: BackButton(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.fullVerticalSize / 1.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
                color: AppColors.bgColor.withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      spreadRadius: 50,
                      color: AppColors.bgColor.withOpacity(0.5)),
                ],
              ),
              child: ListView(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                  right: 20,
                ),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          moviesEntity.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            di<FavoriteMoviesBloc>().add(
                              AddToFavoritesEvent(entity: moviesEntity),
                            );
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColors.bgColor,
                          ))
                    ],
                  ),
                  25.verticalSpace,
                  Text(
                    '${formatDateTime(moviesEntity.releaseDate)} - ${moviesEntity.duration}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    moviesEntity.rating.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      color: AppColors.bgColor,
                    ),
                  ),
                  10.verticalSpace,
                  _generateRating(moviesEntity.rating),
                  20.verticalSpace,
                  Text(
                    moviesEntity.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  30.verticalSpace,
                  const Text(
                    'Cast',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  25.verticalSpace,
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 80,
                            imageUrl: moviesEntity.cast[index].photoUrl),
                      ),
                      separatorBuilder: (context, index) => 20.horizontalSpace,
                      itemCount: moviesEntity.cast.length,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _generateRating(double rating) {
  final count = rating.toInt() / 2;
  List<Widget> stars = [];
  for (var i = 0; i < 5; i++) {
    if (i > count) {
      stars.add(const Icon(
        Icons.star,
        color: AppColors.bgColor,
      ));
    } else {
      stars.add(const Icon(
        Icons.star_border,
        color: AppColors.bgColor,
      ));
    }
  }
  stars.add(10.horizontalSpace);
  stars.add(
    Text(
      '${count.toInt()}/5 star rating',
      style: const TextStyle(fontSize: 16, color: AppColors.bgColor),
    ),
  );
  return Row(
    children: stars,
  );
}
