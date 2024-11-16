import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/int_extension.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                'Вся вселенная',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {},
              child: const Text(
                'Ищу',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {},
              child: const Text(
                'Новые',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {},
              child: const Text(
                'Соблазны',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {},
              child: const Text(
                'Возраст',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {},
              child: const Text(
                'Рост',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {},
              child: const Text(
                'Онлайн',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
