import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/int_extension.dart';
import 'package:movie_app/modules/home/presentation/widget/background_circle.dart';
import 'package:movie_app/modules/home/presentation/widget/bottom_navigation_bar.dart';
import 'package:movie_app/modules/home/presentation/widget/latest_movies.dart';
import 'package:movie_app/modules/home/presentation/widget/top_navigation_bar.dart';

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
      body: Stack(
        children: [
          const Positioned(child: TopNavigationBar()),
          const BottomNavigation(),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 300,
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
