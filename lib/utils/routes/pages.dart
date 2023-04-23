import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/utils/bindings/bottom_nav_bar_controller_binding.dart';
import 'package:world_cup_qatar_2022/utils/bindings/main_controller_binding.dart';
import 'package:world_cup_qatar_2022/utils/bindings/scraping_controller_binding.dart';
import 'package:world_cup_qatar_2022/utils/routes/routes.dart';
import 'package:world_cup_qatar_2022/view/pages/competition_stats_page.dart';
import 'package:world_cup_qatar_2022/view/pages/landing_page.dart';
import 'package:world_cup_qatar_2022/view/pages/main_page.dart';
import 'package:world_cup_qatar_2022/view/pages/news_details.dart';
import 'package:world_cup_qatar_2022/view/screens/bottom_nav_bar/competition_screen.dart';
import 'package:world_cup_qatar_2022/view/screens/bottom_nav_bar/home_screen.dart';
import 'package:world_cup_qatar_2022/view/screens/bottom_nav_bar/matches_screen.dart';



abstract class AppPages {

  static final List<GetPage> pages = [
    _landingPage,
    _mainPage,
    _homeScreen,
    _matchesScreen,
    _competitionScreen,
    _newsDetailsPage,
    _competitionStatsPage,
  ];

  static final GetPage _landingPage = GetPage(
    name: AppRoutes.landingPage,
    page: () => const LandingPage(),
  );

  static final GetPage _mainPage = GetPage(
    name: AppRoutes.mainPage,
    page: () => const MainPage(),
    bindings: [MainControllerBinding(), BottomNavBarControllerBinding(), ScrapingControllerBinding()],
  );

  static final GetPage _homeScreen = GetPage(
    name: AppRoutes.homeScreen,
    page: () => const HomeScreen(),
  );

  static final GetPage _matchesScreen = GetPage(
    name: AppRoutes.matchesScreen,
    page: () => const MatchesScreen(),
  );

  static final GetPage _competitionScreen = GetPage(
    name: AppRoutes.competitionScreen,
    page: () => const CompetitionScreen(),
  );

  static final GetPage _newsDetailsPage = GetPage(
    name: AppRoutes.newsDetailsPage,
    page: () => const NewsDetailsPage(),
  );

  static final GetPage _competitionStatsPage = GetPage(
    name: AppRoutes.competitionStatsPage,
    page: () => const CompetitionStatsPage(),
  );


}
