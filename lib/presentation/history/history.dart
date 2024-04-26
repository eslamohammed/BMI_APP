import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';

import '../utils/styles_manager.dart';
import '../utils/values_manager.dart';

// i will add bloc builder here to build firebase data
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

var historyList = [
  // History(height: 180, weight: 70, gender: 'male', age: 25, bmiStatus: '${70/(1.8*1.8)}',),
  // History(height: 180, weight: 65, gender: 'male', age: 25, bmiStatus: '${65/(1.8*1.8)}',),
  // History(height: 180, weight: 90, gender: 'male', age: 25, bmiStatus: '${90/(1.8*1.8)}',),
  // History(height: 180, weight: 75, gender: 'male', age: 25, bmiStatus: '${75/(1.8*1.8)}',),
  // History(height: 180, weight: 80, gender: 'male', age: 25, bmiStatus: '${80/(1.8*1.8)}',),
];

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Text(
            'Your BMI History 📃',
            style: headline2.copyWith(color: ColorManager.deepBlue),
          ),
          elevation: AppSize.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.lightPrimary,
              statusBarBrightness: Brightness.light),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ColorManager.deepBlue,
              ))),
      backgroundColor: ColorManager.white,
      body: ListView.builder(
          itemCount: historyList.length,
          itemBuilder: (BuildContext context, int index) {
            return historyList[index];
          }),
    );
  }
}