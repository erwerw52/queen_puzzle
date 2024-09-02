import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_puzzle/common/component/index.dart';

import 'index.dart';

class QueensPuzzlePage extends GetView<QueensPuzzleController> {
  const QueensPuzzlePage({super.key});

  Widget _buildView(BuildContext context) {
    double heightH = MediaQuery.of(context).size.height;
    double widthW = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'n*n數:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                      width: 90,
                      height: 35,
                      child: IntegerTextField(value: controller.itfQueenNum))
                  .paddingOnly(left: 5),
              ElevatedButton(
                onPressed: () => controller.onTap(),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                child: const Text(
                  '解法',
                  style: TextStyle(color: Colors.black),
                ),
              ).paddingOnly(left: 10),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: heightH - 55,
              width: widthW,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Obx(() => controller.createSolution(widthW)),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QueensPuzzleController>(
      init: QueensPuzzleController(),
      id: "queens_puzzle",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}
