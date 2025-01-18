import 'package:auto_route/auto_route.dart';
import 'package:movie_app/core/service/auto_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: MovieDetailsRoute.page)
      ];
}
