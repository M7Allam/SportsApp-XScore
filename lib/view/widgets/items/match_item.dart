import 'package:flutter/material.dart';
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';
import 'package:world_cup_qatar_2022/utils/general_methods.dart';
import 'package:world_cup_qatar_2022/utils/values/assets.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/match.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/team.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:world_cup_qatar_2022/view/widgets/animations/fade_in_widget.dart';

class MatchItem extends StatelessWidget {

  final Match match;
  final MatchItemDesign design;

  const MatchItem({
    required this.match,
    required this.design,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppDimens.run(68),
      padding: EdgeInsets.only(bottom: AppDimens.run(2),),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.backgroundItems,
        borderRadius: BorderRadius.circular(AppDimens.run(16.0)),
      ),
      child: Builder(builder: (context){
        if(design == MatchItemDesign.homeScreen){
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ///Header
              Builder(builder: (context) {
                if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
                  return const LiveSectionItem();
                }
                if(match.status == MatchStatus.TIMED || match.status == MatchStatus.FINISHED){
                  String text = _switchMatchStage();
                  return MatchHeaderItem(text: text,);
                }
                return const SizedBox();
              }),

              ///Body
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.run(4.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///HomeTeam
                      Expanded(child: HomeTeamItem(team: match.homeTeam)),
                      SizedBox(width: AppDimens.run(16.0),),

                      ///MatchScore
                      Builder(builder: (context){
                        if(match.status == MatchStatus.TIMED){
                          return MatchTimeItem(text: formatMatchTime(match.dateTime));
                        }

                        if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
                          return Column(
                            children: [
                              Builder(
                                builder: (context) {
                                  if(match.score.liveMinutes == null) {
                                    return const MinutesLiveLoading();
                                  }
                                  return MatchLiveMinutesItem(text: match.score.liveMinutes!);
                                },
                              ),
                              MatchResultItem(
                                homeScore: match.score.homeScore??0,
                                awayScore: match.score.awayScore??0,
                                isLiveMatch: true,
                              ),
                            ],
                          );

                        }

                        if(match.status == MatchStatus.FINISHED){
                          return MatchResultItem(homeScore: match.score.homeScore??0, awayScore: match.score.awayScore??0, isLiveMatch: false,);
                        }

                        return const SizedBox();
                      }),
                      SizedBox(width: AppDimens.run(16.0),),

                      ///AwayTeam
                      Expanded(child: AwayTeamItem(team: match.awayTeam)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        if(design == MatchItemDesign.matchesScreen){
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ///Header
              Builder(builder: (context) {
                if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
                  return const LiveSectionItem();
                }
                if(match.status == MatchStatus.TIMED || match.status == MatchStatus.FINISHED){
                  String text = _switchMatchStage();
                  return MatchHeaderItem(text: text,);
                }
                return const SizedBox();
              }),

              ///Body
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.run(4.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///HomeTeam
                      Expanded(child: HomeTeamItem(team: match.homeTeam)),
                      SizedBox(width: AppDimens.run(16.0),),

                      ///MatchScore
                      Builder(builder: (context){
                        if(match.status == MatchStatus.TIMED){
                          return MatchTimeItem(text: formatMatchTime(match.dateTime));
                        }

                        if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
                          return Column(
                            children: [
                              Builder(
                                builder: (context) {
                                  if(match.score.liveMinutes == null) {
                                    return const MinutesLiveLoading();
                                  }
                                  return MatchLiveMinutesItem(text: match.score.liveMinutes!);
                                },
                              ),
                              MatchResultItem(
                                homeScore: match.score.homeScore??0,
                                awayScore: match.score.awayScore??0,
                                isLiveMatch: true,
                              ),
                            ],
                          );

                        }

                        if(match.status == MatchStatus.FINISHED){
                          return MatchResultItem(homeScore: match.score.homeScore??0, awayScore: match.score.awayScore??0, isLiveMatch: false,);
                        }

                        return const SizedBox();
                      }),
                      SizedBox(width: AppDimens.run(16.0),),

                      ///AwayTeam
                      Expanded(child: AwayTeamItem(team: match.awayTeam)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        if(design == MatchItemDesign.competitionScreen){
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ///Header
              Builder(builder: (context) {
                if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
                  return const LiveSectionItem();
                }
                if(match.status == MatchStatus.TIMED || match.status == MatchStatus.FINISHED){
                  return MatchHeaderItem(text: formatMatchDate(match.dateTime),);
                }
                return const SizedBox();
              }),

              ///Body
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.run(4.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///HomeTeam
                      Expanded(child: HomeTeamItem(team: match.homeTeam)),
                      SizedBox(width: AppDimens.run(16.0),),

                      ///MatchScore
                      Builder(builder: (context){
                        if(match.status == MatchStatus.TIMED){
                          return MatchTimeItem(text: formatMatchTime(match.dateTime));
                        }

                        if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
                          return Column(
                            children: [
                              Builder(
                                builder: (context) {
                                  if(match.score.liveMinutes == null) {
                                    return const MinutesLiveLoading();
                                  }
                                  return MatchLiveMinutesItem(text: match.score.liveMinutes!);
                                },
                              ),
                              MatchResultItem(
                                homeScore: match.score.homeScore??0,
                                awayScore: match.score.awayScore??0,
                                isLiveMatch: true,
                              ),
                            ],
                          );

                        }

                        if(match.status == MatchStatus.FINISHED){
                          return MatchResultItem(homeScore: match.score.homeScore??0, awayScore: match.score.awayScore??0, isLiveMatch: false,);
                        }

                        return const SizedBox();
                      }),
                      SizedBox(width: AppDimens.run(16.0),),

                      ///AwayTeam
                      Expanded(child: AwayTeamItem(team: match.awayTeam)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      }),
    );
  }

  String _switchMatchStage(){
    String text = '';
    switch(match.stage){
      case Stages.LAST_16:
        text = 'Round-16';
        break;
      case Stages.QUARTER_FINALS:
        text = 'Quarter-Finals';
        break;
      case Stages.SEMI_FINALS:
        text = 'Semi-Finals';
        break;
      case Stages.THIRD_PLACE:
        text = 'Third-Place';
        break;
      case Stages.FINAL:
        text = 'Final';
        break;
      case Stages.GROUP_STAGE:
      default: switch(match.group){
        case Groups.GROUP_A:
          text = 'Group A';
          break;
        case Groups.GROUP_B:
          text = 'Group B';
          break;
        case Groups.GROUP_C:
          text = 'Group C';
          break;
        case Groups.GROUP_D:
          text = 'Group D';
          break;
        case Groups.GROUP_E:
          text = 'Group E';
          break;
        case Groups.GROUP_F:
          text = 'Group F';
          break;
        case Groups.GROUP_G:
          text = 'Group G';
          break;
        case Groups.GROUP_H:
          text = 'Group H';
          break;
        case null:
        default:
          text = '';
      }
    }

    return text;
  }


}



class HomeTeamItem extends StatelessWidget {

  final Team team;

  const HomeTeamItem({
    required this.team,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          team.fullName?? 'Home Team',
          style: AppTextStyles.bodyTeamMatch,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: AppDimens.run(6.0),),
        SvgPicture.asset(
          AppAssets.getTeamLogo(team.fullName??'Unknown'),
          width: AppDimens.run(32.0),
          height: AppDimens.run(32.0),
          fit: BoxFit.cover,
        ),

      ],
    );
  }
}

class AwayTeamItem extends StatelessWidget {

  final Team team;

  const AwayTeamItem({
    required this.team,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppAssets.getTeamLogo(team.fullName??'Unknown'),
          width: AppDimens.run(32.0),
          height: AppDimens.run(32.0),
          fit: BoxFit.cover,
        ),
        SizedBox(width: AppDimens.run(6.0),),
        Text(
          team.fullName?? 'Away Team',
          style: AppTextStyles.bodyTeamMatch,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MatchHeaderItem extends StatelessWidget {
  final String text;

  const MatchHeaderItem({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.run(75.0),
      height: AppDimens.run(12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.run(4.0)),
          bottomRight: Radius.circular(AppDimens.run(4.0)),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodyDateMatch,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MatchTimeItem extends StatelessWidget {
  final String text;

  const MatchTimeItem({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInWidget(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.watch_later_rounded, size: AppDimens.run(12.0), color: AppColors.white,),
          SizedBox(width: AppDimens.run(4.0),),
          Text(
            text,
            style: AppTextStyles.bodyTimeMatch,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MatchLiveMinutesItem extends StatelessWidget {
  final String text;

  const MatchLiveMinutesItem({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInWidget(
      child: Text(
        text,
        style: AppTextStyles.bodyMinutesLiveMatch,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LiveSectionItem extends StatelessWidget {
  const LiveSectionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.run(50.0),
      height: AppDimens.run(12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.run(4.0)),
          bottomRight: Radius.circular(AppDimens.run(4.0)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.animLivePulse,
            width: AppDimens.run(12.0),
            height: AppDimens.run(12.0),
            fit: BoxFit.cover,
            repeat: true,
          ),
          SizedBox(width: AppDimens.run(1.0),),
          Text(
            AppStrings.live,
            style: AppTextStyles.bodyDateMatch,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MatchResultItem extends StatelessWidget {
  final int homeScore;
  final int awayScore;
  final bool isLiveMatch;

  const MatchResultItem({
    required this.homeScore,
    required this.awayScore,
    required this.isLiveMatch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isLiveMatch){
      return FadeInWidget(
        child: Text(
          '$homeScore : $awayScore',
          style: AppTextStyles.bodyLiveScoreMatch,
          textAlign: TextAlign.center,
        ),
      );
    }
    return FadeInWidget(
      child: Text(
        '$homeScore : $awayScore',
        style: AppTextStyles.bodyScoreMatch,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MinutesLiveLoading extends StatelessWidget {
  const MinutesLiveLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(AppAssets.animLoadingMinutes,
      width: AppDimens.run(16.0),
      height: AppDimens.run(16.0),
      fit: BoxFit.cover,
      repeat: true,
    );
  }
}


