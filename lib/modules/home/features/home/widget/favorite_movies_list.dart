import 'package:flutter/widgets.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/int_extension.dart';

class FavoriteMoviesList extends StatelessWidget {
  const FavoriteMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        height: 100,
        width: double.infinity,
        color: AppColors.orangeColor,
      ),
      separatorBuilder: (BuildContext context, int index) => 20.verticalSpace,
    );
  }
}
