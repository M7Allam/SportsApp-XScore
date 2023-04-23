import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/main_controller.dart';

class MainControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
  }

}