import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/main_controller.dart';
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:world_cup_qatar_2022/view/widgets/items/match_item.dart';
import 'package:world_cup_qatar_2022/view/widgets/app_background.dart';
import 'package:world_cup_qatar_2022/view/widgets/loading_builder.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return AppBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
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
                              value: controller.dropdownMatchdateItems[controller.currentMatchdateIndex],
                              items: controller.dropdownMatchdateItems.map((e) => DropdownMenuItem(value: e, child: Text(e,),),).toList(),
                              onChanged: (value) {
                                print('@DROPDOWN onChanged value $value');
                                if (value != null) {
                                  controller.emitCurrentMatchdateIndex(controller.dropdownMatchdateItems.indexOf(value));
                                }
                              },
                            ),
                          ),
                          SizedBox(height: AppDimens.run(32.0),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Builder(builder: (context){
                if(controller.isLoadingMatchdateMatches){
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const Center(child: LoadingBuilder(),)
                      ],
                    ),
                  );
                }
                if(controller.currentMatchdateMatches.isEmpty){
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Center(child: Text(AppStrings.matchesNotFound, style: AppTextStyles.bodyMatchesNotFound,)),
                      ],
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: AppDimens.run(8.0)),
                        margin: EdgeInsets.only(bottom: AppDimens.run(32.0)),
                        child: MatchItem(match: controller.currentMatchdateMatches[index], design: MatchItemDesign.matchesScreen,),
                      );
                    },
                    addAutomaticKeepAlives: false,
                    childCount: controller.currentMatchdateMatches.length,
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
