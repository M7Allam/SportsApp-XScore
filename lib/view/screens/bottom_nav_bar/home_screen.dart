import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/main_controller.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping_controller.dart';
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/match_item.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/groups/group_standing_today_match_item.dart';
import 'package:world_cup_qatar_2022/view/widgets/app_background.dart';
import 'package:world_cup_qatar_2022/view/widgets/loading_builder.dart';
import 'package:world_cup_qatar_2022/view/widgets/animations/fade_in_widget.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/news_item.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(AppDimens.run(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.run(16.0),),
                ///Today Matches
                FadeInWidget(
                  duration: const Duration(milliseconds: 500,),
                  isReverse: false,
                  child: Text(
                    AppStrings.todayMatches,
                    style: AppTextStyles.titleSections,
                  ),
                ),
                SizedBox(height: AppDimens.run(16.0),),
                Obx(() {
                  if(Get.find<MainController>().matchesToday.isNotEmpty){
                    return ListView.builder(
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: AppDimens.run(16.0)),
                        child: FadeInWidget(
                          isReverse: Get.find<MainController>().matchesToday[index].status == MatchStatus.IN_PLAY,
                          duration: const Duration(milliseconds: 800),
                          child: MatchItem(match: Get.find<MainController>().matchesToday[index], design: MatchItemDesign.homeScreen,),
                        ),
                      ),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: Get.find<MainController>().matchesToday.length,
                    );
                  }
                  return const FadeInWidget(duration: Duration(milliseconds: 500,), child: Center(child: LoadingBuilder(),));
                }),
                SizedBox(height: AppDimens.run(32.0),),

                ///Groups Standing
                FadeInWidget(
                  duration: const Duration(milliseconds: 500,),
                  isReverse: false,
                  child: Text(
                    AppStrings.standing,
                    style: AppTextStyles.titleSections,
                  ),
                ),
                SizedBox(height: AppDimens.run(16.0),),
                GetBuilder<MainController>(builder: (controller){
                  if(controller.groupsStandingOfTodayMatches.isNotEmpty){
                    return ListView.builder(
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: AppDimens.run(16.0)),
                        child: FadeInWidget(
                          child: GroupStandingTodayMatchItem(standing: controller.groupsStandingOfTodayMatches[index]),
                        ),
                      ),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.groupsStandingOfTodayMatches.length,
                    );
                  }
                  return const FadeInWidget(duration: Duration(milliseconds: 500,), child: Center(child: LoadingBuilder(),),);

                }),
                SizedBox(height: AppDimens.run(32.0),),

                ///Latest News
                FadeInWidget(
                  duration: const Duration(milliseconds: 500,),
                  isReverse: false,
                  child: Text(
                    AppStrings.latestNews,
                    style: AppTextStyles.titleSections,
                  ),
                ),
                SizedBox(height: AppDimens.run(16.0),),
                GetBuilder<ScrapingController>(builder: (scrapingController){
                  if(scrapingController.news.isNotEmpty){
                    return FadeInWidget(
                      child: SizedBox(
                        height: AppDimens.run(300),
                        child: ListView.builder(
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(right: AppDimens.run(16.0)),
                            child: FadeInWidget(
                              child: NewsItem(item: scrapingController.news[index], index: index),
                            ),
                          ),
                          physics: const BouncingScrollPhysics(),
                          //primary: false,
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: scrapingController.news.length,
                        ),
                      ),
                    );
                  }
                  return const FadeInWidget(duration: Duration(milliseconds: 500,), child: Center(child: LoadingBuilder()),);

                }),
                SizedBox(height: AppDimens.run(16.0),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

