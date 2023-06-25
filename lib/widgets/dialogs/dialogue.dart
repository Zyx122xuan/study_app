import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs(){
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "您好！",
            style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,
            )
          ),
          Text(
            "请先登录以进一步使用更多功能。"
          )
        ]
      ),
      actions:[
        TextButton(onPressed: onTap, child: const Text("登录"))
      ],
    );
  }
}