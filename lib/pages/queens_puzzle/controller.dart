import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_puzzle/common/helper/dailog_helper.dart';

import '../../common/index.dart';

class QueensPuzzleController extends GetxController {
  QueensPuzzleController();

  ///皇后數值
  TextEditingController itfQueenNum = TextEditingController(text: '0');
  RxList<Queen> queens = <Queen>[].obs;
  final Image _img = Image.asset('assets/icon/crown.png');

  _initData() {
    update(["queens_puzzle"]);
  }

  void onTap() {
    int qNum = int.parse(itfQueenNum.text);
    queens.clear();
    if (qNum > 9) {
      ApUiHelper().showMessage('大於9以上目前不計算', true, 2000);
      return;
    } else if (qNum <= 0) {
      ApUiHelper().showMessage('不可輸入小於等於0', true, 2000);
      return;
    }
    DateTime start = DateTime.now();
    List<Queen> calcQueens = Calcutil().solve(int.parse(itfQueenNum.text));
    DateTime end = DateTime.now();
    print('回朔法計算經過時間:${(end.millisecond - start.millisecond) / 1000}秒');
    queens.value = calcQueens;
  }

  Column createSolution(double widthW) {
    DateTime start = DateTime.now();
    List<Widget> childrens = [];
    if (queens.isEmpty) {
      childrens.add(Text(
          'Not find any solution in ${itfQueenNum.text} x ${itfQueenNum.text}'));
    } else {
      for (int i = 0; i < queens.length; i++) {
        childrens.add(Container(
          color: const Color.fromARGB(255, 50, 115, 255),
          width: widthW,
          child: Center(
              child: Text(
            'Solution ${queens[i].solutionCount}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
        ));
        Map<int, List<String>> solution = queens[i].solution;
        for (int j = 0; j < solution.length; j++) {
          List<Widget> rowChildrens = [];
          List<String> rowStrs = solution[j]!;
          for (int k = 0; k < rowStrs.length; k++) {
            String txt = rowStrs[k];
            if (txt == 'Q') {
              rowChildrens.add(
                  SizedBox(height: 20, width: 20, child: _img).paddingAll(15));
            } else {
              rowChildrens.add(const Text(
                ' * ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingAll(15));
            }
          }
          childrens.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowChildrens,
          ));
        }
      }
    }
    DateTime end = DateTime.now();
    print('放到畫面經過時間:${(end.millisecond - start.millisecond) / 1000}秒');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: childrens,
    );
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
