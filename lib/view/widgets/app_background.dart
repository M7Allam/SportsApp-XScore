import 'package:flutter/material.dart';
import 'package:world_cup_qatar_2022/utils/values/assets.dart';

class AppBackground extends StatelessWidget {

  final Widget child;

  const AppBackground({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.appBackground),
            fit: BoxFit.fill
        ),
      ),
      child: child,
    );
  }
}
