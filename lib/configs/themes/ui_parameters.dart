import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorderRadius = 10.0;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters{
  static BorderRadius get cardBorderRadius=> BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding=> const EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode(){
    // 亮度暗即为暗色模式
    return Get.isDarkMode?true:false;
  }
}