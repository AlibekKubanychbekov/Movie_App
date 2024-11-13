import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';
import 'package:shimmer/shimmer.dart';

class MovieDeetailsBg extends StatelessWidget {
  final String posterUrl;
  const MovieDeetailsBg({
    required this.posterUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: (context.fullVerticalSize / 3) * 2.5,
          width: double.infinity,
          child: CachedNetworkImage(
            width: 150,
            fit: BoxFit.cover,
            imageUrl: posterUrl,
            placeholder: (context, url) => SizedBox(
              height: 280,
              width: 150,
              child: Shimmer.fromColors(
                baseColor: AppColors.bgColor,
                highlightColor: Colors.yellow,
                child: Container(
                  height: 280,
                  width: 150,
                  color: AppColors.bgColor,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: context.fullVerticalSize / 4,
            decoration: const BoxDecoration(color: Colors.black, boxShadow: [
              BoxShadow(blurRadius: 100, spreadRadius: 50, color: Colors.black)
            ]),
          ),
        )
      ],
    );
  }
}
