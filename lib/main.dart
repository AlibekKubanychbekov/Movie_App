import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/service/auto_router.dart';
import 'package:movie_app/modules/data/repository/movies_repo_impl.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(
            fetchMoviesUsecase: FetchMoviesUsecase(
              repo: MoviesRepoImpl(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router.config(),
      ),
    );
  }
}
