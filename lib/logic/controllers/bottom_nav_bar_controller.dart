import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/view/screens/bottom_nav_bar/home_screen.dart';
import 'package:world_cup_qatar_2022/view/screens/bottom_nav_bar/matches_screen.dart';
import 'package:world_cup_qatar_2022/view/screens/bottom_nav_bar/competition_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarController extends GetxController{

  //region:: Variables
  int _bottomNavIndex = 0;
  final List<BottomNavigationBarItem> _itemsBottomNav = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 18,
      ),
      label: AppStrings.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.futbol,
        size: 18,
      ),
      label: AppStrings.matches,

    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.trophy,
        size: 18,
      ),
      label: AppStrings.competition,
    ),
  ];
  final List<Widget> _bottomNavScreens = const [
    HomeScreen(),
    MatchesScreen(),
    CompetitionScreen(),
  ];

  //endregion

  //region:: Getter
  int get index => _bottomNavIndex;
  List<BottomNavigationBarItem> get items => _itemsBottomNav;
  List<Widget> get screens => _bottomNavScreens;
  //endregion

  //region:: emit States
  void emitBottomNavIndex(int newIndex){
    _bottomNavIndex = newIndex;
    update();
  }
  //endregion




}