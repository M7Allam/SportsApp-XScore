import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/fonts.dart';
import 'package:world_cup_qatar_2022/utils/tags.dart';

abstract class AppThemes{


  static ThemeData light = Theme.of(Get.find(tag: AppTags.context)).copyWith(
    primaryColor: AppColors.primary,
    bottomNavigationBarTheme: BottomNavigationBarTheme.of(Get.find(tag: AppTags.context)).copyWith(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      selectedLabelStyle: const TextStyle(
        fontFamily: AppFonts.rajdhani,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: AppFonts.rajdhani,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
  );


}

abstract class AppTextStyles{

  static TextStyle titleSections = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(18.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle titleStages = TextStyle(
    color: AppColors.primary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(16.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle titleStandings = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(15.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle titleNewsItem = TextStyle(
    color: AppColors.primary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(16.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle titleDetailsNewsItem = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(20.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle headerStanding = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(12.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle headerPtsStanding = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(13.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle headerScorers = TextStyle(
    color: AppColors.primary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(16.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle headerDropdownMatchday = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(17.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyMatchesNotFound = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(18.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyTeamMatch = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(16.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyMinutesLiveMatch = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(13.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyTimeMatch = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(13.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyDateMatch = TextStyle(
    color: AppColors.primary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(10.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyScoreMatch = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(20.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyLiveScoreMatch = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(20.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyMinuteMatch = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(10.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyGoalLive = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(12.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyTeamNameStanding = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(12.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyTeamDataStanding = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(11.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyTeamPtsStanding = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(13.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyRankType1Standing = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(12.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyRankType2Standing = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(11.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyFirstScorerStanding = TextStyle(
    color: AppColors.secondary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(16.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyScorersStanding = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(14.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyPreviewNewsItem = TextStyle(
    color: AppColors.primary,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(11.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyDetailsNewsItem = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.rajdhani,
    fontSize: AppDimens.run(14.0),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

}