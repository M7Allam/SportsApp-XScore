import 'package:flutter/material.dart';
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';
import 'package:world_cup_qatar_2022/utils/tags.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/utils/constants.dart';

Stages getStage(String stage){
  switch(stage){
    case 'FINAL':
    return Stages.FINAL;
    case 'THIRD_PLACE':
    return Stages.THIRD_PLACE;
    case 'SEMI_FINALS':
    return Stages.SEMI_FINALS;
    case 'QUARTER_FINALS':
    return Stages.QUARTER_FINALS;
    case 'LAST_16':
    return Stages.LAST_16;
    case 'GROUP_STAGE':
    default: return Stages.GROUP_STAGE;
  }


}

Groups getGroup(String? group){
  switch(group){
    case 'GROUP_H':
      return Groups.GROUP_H;
    case 'GROUP_G':
      return Groups.GROUP_G;
    case 'GROUP_F':
      return Groups.GROUP_F;
    case 'GROUP_E':
      return Groups.GROUP_E;
    case 'GROUP_D':
      return Groups.GROUP_D;
    case 'GROUP_C':
      return Groups.GROUP_C;
    case 'GROUP_B':
      return Groups.GROUP_B;
    case 'GROUP_A':
    default: return Groups.GROUP_A;

  }
}

MatchStatus getMatchStatus(String status){
  switch(status){
    case 'TIMED':
      return MatchStatus.TIMED;
    case 'IN_PLAY':
      return MatchStatus.IN_PLAY;
    case 'PAUSED':
      return MatchStatus.PAUSED;
    case 'FINISHED':
      return MatchStatus.FINISHED;
    case 'SCHEDULED':
    default: return MatchStatus.SCHEDULED;



  }
}

DateTime? formatDateTime(String? utcDate){
  if(utcDate == null) return null;
  final List<String> dateSplit = utcDate.split('T');
  final String date = dateSplit[0];
  final String time = dateSplit[1].split('Z').first;
  DateTime? dateTime = DateTime.tryParse('$date $time');
  DateTime? dateTimeUtc;
  if(dateTime != null) {
    dateTimeUtc = DateTime.utc(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second);
  }
  return dateTimeUtc?.toLocal();
}

String formatMatchDate(DateTime? dateTime){
  if(dateTime == null) return '';
  String monthName = monthsShortNames[dateTime.month]?? '';
  return '${dateTime.day} $monthName';
}

String formatMatchTime(DateTime? dateTime){
  if(dateTime == null) return '';
  String hourStr = dateTime.hour.toString();
  if(dateTime.hour < 10) hourStr = '0$hourStr';
  String minuteStr = dateTime.minute.toString();
  if(dateTime.minute < 10) minuteStr = '0$minuteStr';
  return '$hourStr:$minuteStr';
}

void putDependencies(BuildContext context){
  print('@PUT Dependencies');
  ///App Context
  Get.put<BuildContext>(context, tag: AppTags.context);
  ///Device Timezone
  Get.put<String>(DateTime.now().timeZoneName, tag: AppTags.deviceTimezone);
}

