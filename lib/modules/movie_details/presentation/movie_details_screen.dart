import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';
import 'package:movie_app/core/extension/int_extension.dart';
import 'package:movie_app/core/mixin/date_time_mixin.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/presentation/widget/movie_details_bg.dart';

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
                children: [
                  Text(
                    moviesEntity.title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${formatDateTime(moviesEntity.releaseDate)} - ${moviesEntity.duration}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    moviesEntity.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
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
          ),
        ],
      ),
    );
  }
}
