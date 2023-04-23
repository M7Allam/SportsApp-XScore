import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/fonts.dart';

class AppUpdate extends StatelessWidget {
  final String version;
  const AppUpdate({
    required this.version,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(AppDimens.run(8)),
        child: Column(
          children: [
            Lottie.asset('blue-rocket.json', repeat: true),
            Container(
              width: MediaQuery.of(context).size.width,
              height: AppDimens.run(233),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(AppDimens.run(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimens.run(16),),
                  Text(
                    'New update available!',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.rajdhani,
                      fontSize: AppDimens.run(24),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppDimens.run(4),),

                  Text(
                    'Update 1.0.2 is available to download.\nDownloading the latest update you will get the latest features.',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.rajdhani,
                      fontSize: AppDimens.run(16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: AppDimens.run(24),),

                  Text(
                    'Update to new version now!',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.rajdhani,
                      fontSize: AppDimens.run(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: AppDimens.run(16),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppDimens.run(16)),
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: AppFonts.rajdhani,
                              fontSize: AppDimens.run(16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(AppDimens.run(16)),
                        ),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFonts.rajdhani,
                              fontSize: AppDimens.run(16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
