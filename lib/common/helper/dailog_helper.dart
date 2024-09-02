import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApUiHelper {
  ApUiHelper._privateConstructor();
  static final ApUiHelper _instance = ApUiHelper._privateConstructor();
  factory ApUiHelper() {
    return _instance;
  }

  ///可於AP視窗上顯示訊息，維持一段時間消失<br>
  ///[msg] 顯示文字<br>
  ///[isWarn] 是否為警示，若true則秀紅字<br>
  ///[showMilliSecs] 顯示持續ms，若null則預設1秒
  void showMessage(String msg, bool isWarn, int? showMilliSecs) {
    showMilliSecs ??= 1000;
    var context = Get.context;
    if (context == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Container(
            alignment: Alignment.center,
            child: Text(msg,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isWarn ? Colors.red.shade900 : Colors.black))),
        duration: Duration(milliseconds: showMilliSecs),
      ),
    );
  }
}
