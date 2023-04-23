import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/logic/controllers/main_controller.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping_controller.dart';

class ScrapingControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ScrapingController>(ScrapingController(), permanent: true);
  }

}