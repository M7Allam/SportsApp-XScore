import 'package:flutter/material.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/group_standing.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/table_team.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:world_cup_qatar_2022/utils/values/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/groups/title_group_standing_item.dart';
import 'package:lottie/lottie.dart';

class GroupStandingTodayMatchItem extends StatelessWidget {

  final GroupStanding standing;

  const GroupStandingTodayMatchItem({
    required this.standing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppDimens.run(180),
      decoration: BoxDecoration(
        color: AppColors.backgroundItems,
        borderRadius: BorderRadius.circular(AppDimens.run(16)),
      ),
      child: Stack(
        children: [
          ///Group title
          TitleGroupStandingItem(title: standing.title),
          ///Headers and Teams
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppDimens.run(8),),
              ///Headers
              const HeadersStandingTodayMatchItem(),
              ///Teams
              Column(
                children: [
                  ///Group team 1
                  TeamStandingTodayMatchItem(tableTeam: standing.table[0]),
                  SizedBox(height: AppDimens.run(8),),
                  ///Group team 2
                  TeamStandingTodayMatchItem(tableTeam: standing.table[1]),
                  SizedBox(height: AppDimens.run(8),),
                  ///Group team 3
                  TeamStandingTodayMatchItem(tableTeam: standing.table[2]),
                  SizedBox(height: AppDimens.run(8),),
                  ///Group team 4
                  TeamStandingTodayMatchItem(tableTeam: standing.table[3]),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class HeadersStandingTodayMatchItem extends StatelessWidget {
  const HeadersStandingTodayMatchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///Info Empty
        const Expanded(
          flex: 8,
          child: SizedBox(),
        ),
        const Spacer(flex: 2,),

        ///Data
        Expanded(
          flex: 12,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: AppDimens.run(3),),
              ///Pts
              Text(
                'Pts',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTeamPtsStanding,
              ),
              const Spacer(flex: 2,),
              SizedBox(width: AppDimens.run(2),),
              ///Played
              Text(
                'P',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTeamDataStanding,
              ),
              const Spacer(flex: 2,),
              ///Won
              Text(
                'W',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTeamDataStanding,
              ),
              const Spacer(flex: 2,),
              ///Draw
              Text(
                'D',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTeamDataStanding,
              ),
              const Spacer(flex: 2,),
              ///Lost
              Text(
                'L',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTeamDataStanding,
              ),
              const Spacer(flex: 2,),
              ///GD
              Text(
                'GD',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTeamDataStanding,
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      ],
    );
  }
}

class TeamStandingTodayMatchItem extends StatelessWidget {

  final TableTeam tableTeam;

  const TeamStandingTodayMatchItem({
    required this.tableTeam,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.run(16), top: AppDimens.run(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Info
          Expanded(
            flex: 8,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///Rank
                Container(
                  width: AppDimens.run(16),
                  height: AppDimens.run(16),
                  decoration: BoxDecoration(
                    color: tableTeam.position < 3 ? AppColors.white : AppColors.primary,
                    borderRadius: BorderRadius.circular(AppDimens.run(4)),
                  ),
                  child: Center(
                    child: Text(
                      tableTeam.position.toString(),
                      textAlign: TextAlign.center,
                      style: tableTeam.position < 3 ? AppTextStyles.bodyRankType1Standing : AppTextStyles.bodyRankType2Standing,
                    ),
                  ),
                ),
                SizedBox(width: AppDimens.run(12),),
                ///Logo
                SvgPicture.asset(
                  AppAssets.getTeamLogo(tableTeam.team.fullName??'FIFA'),
                  width: AppDimens.run(16.0),
                  height: AppDimens.run(16.0),
                  fit: BoxFit.cover,
                ),
                SizedBox(width: AppDimens.run(6),),
                ///TeamName
                Flexible(
                  flex: 1,
                  child: Text(
                    tableTeam.team.fullName?? 'Team Name',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.bodyTeamNameStanding,
                  ),
                ),
              ],
            ),
          ),
          //const Spacer(flex: 1,),
          SizedBox(width: AppDimens.run(2.0),),

          ///Live Section
          tableTeam.isInLiveMatch? const Flexible(flex: 1, child:  TeamInLiveMatchItem()) : Flexible(flex: 1, child: SizedBox(width: AppDimens.run(20.0),),),
          const Spacer(flex: 1,),

          ///Data
          Expanded(
            flex: 12,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///Pts
                Text(
                  tableTeam.pts.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTeamPtsStanding,
                ),
                const Spacer(flex: 2,),
                SizedBox(width: AppDimens.run(4),),
                ///Played
                Text(
                  tableTeam.played.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTeamDataStanding,
                ),
                const Spacer(flex: 2,),
                ///Won
                Text(
                  tableTeam.won.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTeamDataStanding,
                ),
                const Spacer(flex: 2,),
                ///Draw
                Text(
                  tableTeam.draw.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTeamDataStanding,
                ),
                const Spacer(flex: 2,),
                ///Lost
                Text(
                  tableTeam.lost.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTeamDataStanding,
                ),
                const Spacer(flex: 2,),
                ///GD
                Text(
                  tableTeam.GD.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTeamDataStanding,
                ),
                const Spacer(flex: 2,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamInLiveMatchItem extends StatelessWidget {
  const TeamInLiveMatchItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAssets.animLivePulse,
      width: AppDimens.run(20.0),
      height: AppDimens.run(20.0),
      fit: BoxFit.cover,
      repeat: true,
    );
  }
}




