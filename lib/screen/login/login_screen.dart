import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/auth_controller.dart';

import '../../widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/app_splash_logo.png",
                width: 200, height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: const Text(
                "欢迎使用在线学习app！在这里你可以获得到更多的学科知识。学如逆水行舟，不进则退。不积跬步，无以至千里。",
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              onTap: () {
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset("assets/icons/google.svg")),
                  Center(
                    child: Text("使用Google账号登录",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
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
