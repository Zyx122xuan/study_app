import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/question_paper_model.dart';
import '../../screen/question/questions_screen.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      // 从数据库获取试卷
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs.map((paper)=> QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      // 从数据库获取图片url
      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain=false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain){

        Get.back();
        Get.toNamed(QuestionsScreen.routeName, arguments: paper, preventDuplicates: false);
        //Get.offNamed(page);
      }else{
        //print("logged in");

        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
      }
    }else{
      //print('试卷标题为${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
