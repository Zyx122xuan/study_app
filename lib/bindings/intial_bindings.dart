import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';

import '../services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies(){
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() =>  FirebaseStorageService());
  }
}