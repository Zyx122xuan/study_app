import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';

import '../../widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 65),
                SizedBox(height: 40),
                const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: onSurfaceTextColor,
                        fontWeight: FontWeight.bold),
                    '欢迎使用本学习app\n享受学习 简单学习\n学有所用 带来无限遐想\n自主学习的快乐！'),
                SizedBox(height: 40),
                AppCircleButton(
                    onTap: () => Get.offAndToNamed("/home"),
                    child: const Icon(Icons.arrow_forward, size: 35))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
