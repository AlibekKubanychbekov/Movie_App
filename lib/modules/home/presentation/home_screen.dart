import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';
import 'package:movie_app/core/theme/background_circle.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_event.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _moviesBloc = di<MoviesBloc>();
  @override
  void initState() {
    _moviesBloc.add(FetchMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Positioned(
            top: context.fullHorizontalSize / 5,
            left: 400,
            child: const BackgroundCircle(
              color: AppColors.bgOpacityColor,
              radius: 208,
            ),
          ),
          Positioned(
            bottom: context.fullVerticalSize / 3,
            right: 450,
            child: const BackgroundCircle(
              color: AppColors.bgOpacityColor,
              radius: 208,
            ),
          ),
        ],
      ),
    );
  }
}
