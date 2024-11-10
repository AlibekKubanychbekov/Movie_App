import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_event.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_state.dart';

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
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: BlocProvider.value(
        value: _moviesBloc,
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state.status == StateStatus.loaded) {
              return Center(
                child: Text(state.model?.length.toString() ?? ''),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
