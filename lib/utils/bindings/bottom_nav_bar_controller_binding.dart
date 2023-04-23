import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/bottom_nav_bar_controller.dart';

class BottomNavBarControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<BottomNavBarController>(BottomNavBarController(), permanent: true);
  }

}