import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/service/auto_router.dart';
import 'package:movie_app/core/service/service_locator.dart' as get_it;

final di = GetIt.instance;

void main() {
  get_it.setup(di);
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
