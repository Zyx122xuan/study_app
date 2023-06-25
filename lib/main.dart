import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study_app/bindings/intial_bindings.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/routes/app_routes.dart';
import 'configs/themes/ui_parameters.dart';
import 'data_uploader_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

// 将数据上传到后端
/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Get.isDarkMode
      //     ? Get.find<ThemeController>().lightTheme
      //     : Get.find<ThemeController>().darkTheme,
        //theme: Get.find<ThemeController>().darkTheme,
        theme: Get.find<ThemeController>().lightTheme,
        getPages: AppRoutes.routes(),
    );
  }
}
