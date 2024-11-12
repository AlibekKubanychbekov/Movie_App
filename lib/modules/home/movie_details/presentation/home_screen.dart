import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/int_extension.dart';
import 'package:movie_app/core/theme/background_circle.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/modules/home/movie_details/presentation/widget/latest_movies.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          const Positioned(
            child: BackgroundCircles(),
          ),
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: Colors.white,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 280,
                  child: LatestMovies(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
