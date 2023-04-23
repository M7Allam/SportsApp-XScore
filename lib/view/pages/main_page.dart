import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/bottom_nav_bar_controller.dart';
import 'package:world_cup_qatar_2022/logic/controllers/main_controller.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping.dart';
import 'package:world_cup_qatar_2022/utils/general_methods.dart';
import 'package:animations/animations.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    putDependencies(context);
    //Get.find<MainController>().getOneFootballWebsiteHtmlPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index,
          items: controller.items,
          onTap: (index){
            controller.emitBottomNavIndex(index);
            final mainController = Get.find<MainController>();
            if(controller.index == 1 && mainController.allMatches.isEmpty) mainController.getAllMatches();
            if(controller.index == 2 && mainController.allGroupsStanding.isEmpty) mainController.getAllGroupsStanding();
            if(controller.index == 2 && mainController.allMatches.isEmpty) mainController.getAllMatches();
          },
        ),
        body: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: AppColors.black,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 600),
          child: controller.screens[controller.index],
        ),
      ),
    );
  }
}
