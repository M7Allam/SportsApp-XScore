import 'package:flutter/material.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';

class TitleGroupStandingItem extends StatelessWidget {

  final String title;

  const TitleGroupStandingItem({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: AppDimens.run(100),
        height: AppDimens.run(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppDimens.run(16)),
            topLeft: Radius.circular(AppDimens.run(16)),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleStandings,
        ),
      ),
    );
  }
}
