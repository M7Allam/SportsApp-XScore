import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/firebase_options.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/fonts.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/utils/routes/routes.dart';
import 'package:world_cup_qatar_2022/utils/routes/pages.dart';
import 'package:world_cup_qatar_2022/utils/bindings/main_controller_binding.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  String version = remoteConfig.getString('version');
  String updateFeatures = remoteConfig.getString('updateFeatures');
  debugPrint('@REMOTE_CONFIG version $version');
  debugPrint('@REMOTE_CONFIG updateFeatures $updateFeatures');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));


  /*runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools
      ],
      builder: (context) => const MyApp(),
    )
  );*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: AppColors.primary,
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.black,
          selectedLabelStyle: const TextStyle(
            fontFamily: AppFonts.rajdhani,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: AppFonts.rajdhani,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ),
      title: AppStrings.appName,
      initialRoute: AppRoutes.mainPage,
      getPages: AppPages.pages,
    );
  }
}
