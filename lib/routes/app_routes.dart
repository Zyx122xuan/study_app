import 'package:get/get.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/screen/introduction/introduction.dart';
import 'package:study_app/screen/question/answer_check_screen.dart';
import '../controllers/question_paper/question_paper_controller.dart';
import '../controllers/question_paper/questions_controller.dart';
import '../screen/home/home_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/question/questions_screen.dart';
import '../screen/question/result_screen.dart';
import '../screen/question/test_overview_screen.dart';
import '../screen/splash/splash_screen.dart';

class AppRoutes{
  static List<GetPage> routes()=>[

    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(name: "/introduction", page: () =>const AppIntroductionScreen()),
    GetPage(name: "/home", page: () => const HomeScreen(), binding: BindingsBuilder((){
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());
    })),
    GetPage(name: LoginScreen.routeName, page: ()=> LoginScreen()),
    GetPage(name: QuestionsScreen.routeName, page: ()=> QuestionsScreen(), binding: BindingsBuilder((){
      Get.put<QuestionsController>(QuestionsController());
    }),

    ),
    GetPage(
      name: TestOverviewScreen.routeName,
      page: ()=> const TestOverviewScreen(),
    ),
    GetPage(
      name: ResultScreen.routeName,
      page: ()=> const ResultScreen(),
    ),
    GetPage(
      name: AnswerCheckScreen.routeName,
      page: ()=> const AnswerCheckScreen(),
    ),

  ];
}