import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/main_controller.dart';
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/utils/routes/routes.dart';
import 'package:world_cup_qatar_2022/view/widgets/animations/fade_in_widget.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/groups/group_standing_item.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/match_item.dart';
import 'package:world_cup_qatar_2022/view/widgets/app_background.dart';
import 'package:world_cup_qatar_2022/view/widgets/loading_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompetitionScreen extends StatelessWidget {
  const CompetitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => AppBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.run(8.0)),
            child: FadeInWidget(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  ///Headers
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            ///Dropdown Stages
                            Padding(
                              padding: EdgeInsets.all(AppDimens.run(8.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///Dropdown
                                  Container(
                                    height: AppDimens.run(42.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppDimens.run(16.0)),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                      BorderRadius.circular(AppDimens.run(24.0)),
                                    ),
                                    child: DropdownButton(
                                      style: AppTextStyles.headerDropdownMatchday,
                                      underline: const SizedBox(),
                                      menuMaxHeight: AppDimens.run(250),
                                      borderRadius: BorderRadius.circular(AppDimens.run(8.0)),
                                      iconEnabledColor: AppColors.black,
                                      value: controller.dropdownStagesItems[controller.currentDropdownStageIndex],
                                      items: controller.dropdownStagesItems.map((e) => DropdownMenuItem(value: e, child: Text(e,),),).toList(),
                                      onChanged: (value) {
                                        print('@DROPDOWN Stages onChanged value $value');
                                        if (value != null) {
                                          controller.emitCurrentStageDropdownIndex(controller.dropdownStagesItems.indexOf(value));
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: AppDimens.run(32.0),),
                                ],
                              ),
                            ),
                            SizedBox(width: AppDimens.run(16.0),),

                            /*
                            ///Stats
                            Padding(
                              padding: EdgeInsets.all(AppDimens.run(8.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      //TODO: gotoCompetitionStatsPage
                                      Get.toNamed(AppRoutes.competitionStatsPage);
                                    },
                                    child: Container(
                                      height: AppDimens.run(42.0),
                                      padding: EdgeInsets.symmetric(horizontal: AppDimens.run(36.0)),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                        BorderRadius.circular(AppDimens.run(24.0)),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.grip,
                                              size: AppDimens.run(16.0),
                                            ),
                                            SizedBox(width: AppDimens.run(8.0),),
                                            Text(
                                              AppStrings.stats,
                                              style: AppTextStyles.headerDropdownMatchday,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: AppDimens.run(32.0),),
                                ],
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///AllGroupsStanding
                  Builder(builder: (context){
                    if(controller.currentDropdownStageIndex == 0){
                      if(controller.allGroupsStanding.isNotEmpty){
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              return FadeInWidget(
                                duration: const Duration(milliseconds: 450),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: AppDimens.run(32.0)),
                                  child: GroupStandingItem(standing: controller.allGroupsStanding[index]),
                                ),
                              );
                            },
                            addAutomaticKeepAlives: false,
                            childCount: controller.allGroupsStanding.length,
                          ),
                        );
                      }
                    }
                    if(controller.currentDropdownStageIndex > 0){
                      if(controller.filterMatchesByStage.isNotEmpty || controller.allMatches.isNotEmpty){
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: AppDimens.run(32.0)),
                                child: MatchItem(match: controller.filterMatchesByStage[index], design: MatchItemDesign.competitionScreen,),
                              );
                            },
                            addAutomaticKeepAlives: false,
                            childCount: controller.filterMatchesByStage.length,
                          ),
                        );
                      }
                    }
                    return SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const Center(child: LoadingBuilder(),),
                        ],
                      ),
                    );
                  }),

                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
