import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/movie_details/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/modules/home/movie_details/presentation/bloc/movies_event.dart';
import 'package:movie_app/modules/home/movie_details/presentation/bloc/movies_state.dart';
import 'package:shimmer/shimmer.dart';

class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<MoviesBloc>()..add(FetchMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (state.status == StateStatus.loaded) {
          return ListView.separated(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                imageUrl: state.model?[index].posterUrl ?? '',
                placeholder: (context, url) => SizedBox(
                  width: 150.0,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.bgColor,
                    highlightColor: Colors.yellow,
                    child: Container(
                      color: AppColors.bgColor,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 30,
            ),
          );
        } else if (state.status == StateStatus.loading) {
          return ListView.separated(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              width: 150.0,
              child: Shimmer.fromColors(
                baseColor: AppColors.bgColor,
                highlightColor: Colors.yellow,
                child: Container(
                  color: AppColors.bgColor,
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 30,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
