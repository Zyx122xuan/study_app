import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // 背景颜色
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset("assets/images/app_splash_logo.png",
        width: 200, height: 200),
      )
    );
  }
}
