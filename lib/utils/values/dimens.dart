import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/utils/tags.dart';

abstract class AppDimens{
  static const double DEFAULT_ASPECT_RATIO = 360/736;

  static double run(double value){
    return (value * AppDimens.getScreenSize().aspectRatio) / AppDimens.DEFAULT_ASPECT_RATIO;
  }

  static Size getScreenSize(){
    final context = Get.find<BuildContext>(tag: AppTags.context);
    return MediaQuery.of(context).size;
  }


}