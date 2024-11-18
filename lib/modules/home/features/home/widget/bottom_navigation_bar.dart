import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_image.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';
import 'package:movie_app/core/extension/int_extension.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.mainImage,
              scale: 2.5,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.chatImage,
              scale: 2.5,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.likeImage,
              scale: 2.5,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              child: Image.asset(
                AppImages.settingsImage,
                scale: 2.5,
              ),
              onTap: () {
                showModalBottomSheet<void>(
                  backgroundColor: AppColors.purpleShadeColor,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: context.fullVerticalSize / 30,
                                    right: context.fullHorizontalSize / 20,
                                  ),
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(
                                      Icons.close_outlined,
                                      color: AppColors.bgColor,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        AppImages.premiumImage,
                                        scale: 3.4,
                                      ),
                                    ),
                                  ],
                                ),
                                30.verticalSpace,
                                const Text(
                                  'РЕЖИМ ИНКОГНИТО НА 24 ЧАСА',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                30.verticalSpace,
                                Text(
                                  'Стань невидимой в ленте и чатахб скрой объявление и наслаждайся <Space> незамеченным',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            label: '',
          ),
        ],
        selectedItemColor: AppColors.orangeColor,
        unselectedItemColor: AppColors.purpleColor,
        backgroundColor: AppColors.blackColor,
      ),
    );
  }
}
