import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/core/extension/int_extension.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorite_movies_bloc.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_event.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_state.dart';
import 'package:movie_app/modules/home/features/home/widget/background_circle.dart';
import 'package:movie_app/modules/home/features/home/widget/favorite_movies_list.dart';
import 'package:movie_app/modules/home/features/home/widget/latest_movies.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _favoriteMoviesCubit = di<FavoriteUsersBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Stack(
        children: [
          const BackgroundCircles(),
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Text(
                'Latest',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              20.verticalSpace,
              const SizedBox(
                height: 300,
                child: LatestMovies(),
              ),
              50.verticalSpace,
              BlocProvider.value(
                value: _favoriteMoviesCubit,
                child: BlocBuilder<FavoriteUsersBloc, FavoriteUsersState>(
                  builder: (context, state) {
                    if (state.status == StateStatus.loaded) {
                      return const FavoriteMoviesList();
                    } else if (state.status == StateStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ElevatedButton(
                          onPressed: () {
                            _favoriteMoviesCubit.add(FetchUserMovies());
                          },
                          child: const Text('fetch'));
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
