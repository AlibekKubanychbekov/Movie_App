import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/background_color.dart';
import 'package:movie_app/core/theme/app_colors.dart';
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
    return const Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Stack(
          children: [
            Positioned(
                top: 40,
                left: 400,
                child: BackgroundColor(
                  color: AppColors.bgOpacityColor,
                  radius: 208,
                )),
            Positioned(
                bottom: 300,
                right: 450,
                child: BackgroundColor(
                  color: AppColors.bgOpacityColor,
                  radius: 208,
                ))
          ],
        ));
  }
}
