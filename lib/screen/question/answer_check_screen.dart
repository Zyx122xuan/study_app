import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';
import 'package:get/get.dart';
import 'package:study_app/screen/question/result_screen.dart';
import 'package:study_app/widgets/common/background_decoration.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/questions/answer_card.dart';

import '../../widgets/common/custom_app_bar.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);
  static const String routeName = "/answercheckscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
            () => Text(
              '题目 ${(controller.questionIndex.value+1).toString().padLeft(2,"0")}',
              style: appBarTS,
            )
        ),
        showActionIcon: true,
        onMenuActionTap: (){
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
          child: Obx(
              ()=> Column(
                children: [
                  Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question
                            ),
                            GetBuilder<QuestionsController>(
                              id: 'answer_review_list',
                                builder: (_){
                              return ListView.separated(
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index){
                                  final answer = controller.currentQuestion.value!.answers[index];
                                  final selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                                  final correctAnswer = controller.currentQuestion.value!.correctAnswer;
                                  final String answerText = '${answer.identifier}. ${answer.answer}';
                                  if(correctAnswer == selectedAnswer && answer.identifier == selectedAnswer){
                                    // 正确答案
                                    return CorrectAnswer(answer: answerText);
                                  }else if(selectedAnswer == null){
                                    //未作答
                                    return NotAnswered(answer: answerText);
                                  }else if(correctAnswer != selectedAnswer && answer.identifier == selectedAnswer){
                                    //错误答案
                                    return WrongAnswer(answer: answerText);
                                  }else if(correctAnswer == answer.identifier){
                                    //其他选项
                                    return CorrectAnswer(answer: answerText);
                                  }
                                  return AnswerCard(
                                      answer: answerText,
                                      onTap: (){},
                                    isSelected: false,
                                  );
                                  },
                                  separatorBuilder: (_, index){
                                  return const SizedBox(
                                  height: 10,
                                  );
                              },
                                  itemCount: controller.currentQuestion.value!.answers.length
                              );
                            })
                          ]
                        )
                      )
                    )
                  )
                ]
              )
          )
      )
    );
  }
}
