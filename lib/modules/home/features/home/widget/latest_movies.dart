import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/core/mixin/date_time_mixin.dart';
import 'package:movie_app/core/service/auto_router.gr.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_event.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_state.dart';
import 'package:shimmer/shimmer.dart';

class LatestMovies extends StatelessWidget with DateTimeMixin {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<MoviesBloc>()..add(FetchMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state.status == StateStatus.loaded) {
            return ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
<<<<<<< HEAD
                onTap: () => context.router.push(MovieDetailsRoute(
=======
                onTap: () => context.router.push<Object>(MovieDetailsRoute(
>>>>>>> 0d265b9 (create date mixin)
                  moviesEntity: state.model?[index] ?? MoviesEntity.empty(),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
                  children: [
=======
                  children: <Widget>[
>>>>>>> 0d265b9 (create date mixin)
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: CachedNetworkImage(
                          width: 150,
                          fit: BoxFit.fitHeight,
                          imageUrl: state.model?[index].posterUrl ?? '',
                          placeholder: (
                            context,
                            url,
                          ) =>
                              SizedBox(
                            height: 280,
                            width: 150,
                            child: Shimmer.fromColors(
                              baseColor: AppColors.bgColor,
                              highlightColor: Colors.yellow,
                              child: Container(
                                color: AppColors.bgColor,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    SizedBox(
                      width: 150,
                      height: 20,
                      child: Text(
                        state.model?[index].title ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      formatDateTime(state.model?[index].releaseDate ?? ''),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                height: 280,
                width: 150,
                child: Shimmer.fromColors(
                  baseColor: AppColors.bgColor,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 280,
                    width: 150,
                    color: AppColors.bgColor,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
