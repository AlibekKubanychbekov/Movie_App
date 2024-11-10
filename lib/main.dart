import 'package:flutter/material.dart';
import 'package:movie_app/core/service/auto_router.dart';

void main() {
  final appRouter = AppRouter();
  runApp(MovieApp(
    router: appRouter,
  ));
}

class MovieApp extends StatelessWidget {
  final AppRouter router;
  const MovieApp({
    required this.router,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
