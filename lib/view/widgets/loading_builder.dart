import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:world_cup_qatar_2022/utils/values/assets.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';

class LoadingBuilder extends StatelessWidget {
  const LoadingBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAssets.animLoading,
      width: AppDimens.run(150),
      height: AppDimens.run(150),
      repeat: true,
    );
  }
}
