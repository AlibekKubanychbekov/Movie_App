// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart' as _i4;
import 'package:movie_app/modules/home/movie_details/presentation/home_screen.dart'
    as _i1;
import 'package:movie_app/modules/home/movie_details/presentation/movie_details_screen.dart'
    as _i2;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.MovieDetailsScreen]
class MovieDetailsRoute extends _i3.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    required _i4.MoviesEntity moviesEntity,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            moviesEntity: moviesEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i2.MovieDetailsScreen(
        moviesEntity: args.moviesEntity,
        key: args.key,
      );
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    required this.moviesEntity,
    this.key,
  });

  final _i4.MoviesEntity moviesEntity;

  final _i5.Key? key;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{moviesEntity: $moviesEntity, key: $key}';
  }
}
