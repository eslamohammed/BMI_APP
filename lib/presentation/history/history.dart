import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/widget/historyWidget.dart';


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
        title: const Text('Your BMI Histories',style: TextStyle( color: Color(0xFF212121)),),
        backgroundColor: ColorManager.darkGrey,
        shadowColor: ColorManager.darkGrey,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
          }, icon: const Icon(Icons.arrow_back ,color: Color(0xFF212121),))
        ]
        ),
      backgroundColor: ColorManager.darkGrey,
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index){
          return historyList[index];
        }
      ),
    );
  }
}