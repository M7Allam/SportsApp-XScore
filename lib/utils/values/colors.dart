import 'package:flutter/material.dart';

abstract class AppColors{
  static const Color primary = Color(0xffBF2154);
  static const Color secondary = Color(0xffFFE27A);
  static const Color white = Color(0xffF4F3F3);
  static const Color black = Color(0xff202020);
  static const Color blue = Color(0xff0D98BF);
  static const Color backgroundItems = Color(0x80392c2c);
  static const Gradient gradientSilver = LinearGradient(colors: [Color(0xffF4F3F3), Color(0xffCAC8C4),], begin: AlignmentDirectional.topCenter, end: Alignment.bottomCenter);

}