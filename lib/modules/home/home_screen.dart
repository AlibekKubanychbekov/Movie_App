import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';
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
    return const Scaffold(
      body: Stack(children: [
        Positioned(child: TopNavigationBar()),
        BottomNavigation(),
      ]),
    );
  }
}
