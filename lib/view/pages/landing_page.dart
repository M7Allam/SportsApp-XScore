import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:world_cup_qatar_2022/utils/routes/routes.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/view/widgets/app_update.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /*
          Builder(builder: (context){

            Future.delayed(const Duration(seconds: 3), () {
              Get.offNamed(AppRoutes.mainPage);
            },);
            return const SizedBox();
          }),*/
        ],
      ),
    );
  }

  Future<void> remoteConfig() async{
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 60),
      minimumFetchInterval: Duration(seconds: 1),
    ));
    await remoteConfig.fetchAndActivate();
    final appVersionFromRemoteConfig = remoteConfig.getString('version');
    final appVersionFromPackage = await getAppVersion();
    if(appVersionFromRemoteConfig != appVersionFromPackage)
      showAppUpdateDialog(appVersionFromRemoteConfig);
  }

  void showAppUpdateDialog(String version){
    Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsetsDirectional.zero,
      contentPadding: EdgeInsetsDirectional.zero,
      backgroundColor: Colors.transparent,
      content: AppUpdate(version: version),
      onWillPop: () async{
        return false;
      },
      //barrierDismissible: false,
      //barrierColor: Colors.black.withOpacity(0.75),
      //transitionDuration: Duration(milliseconds: 850),
      //transitionCurve: Curves.easeIn,
    );

  }

  Future<String> getAppVersion() async{
    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version;
    return appVersion;
  }
}
