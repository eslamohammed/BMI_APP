import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/strings_manager.dart';
import 'package:ibm_task/presentation/utils/styles_manager.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';
import 'package:ibm_task/widget/container_box.dart';
import 'package:ibm_task/widget/data_container.dart';


final activeColor = ColorManager.primary;
const inActiveColor = ColorManager.dustGrey;


Color maleBoxColor = activeColor;
Color femaleBoxColor = inActiveColor;

class History extends StatelessWidget {
  final int height;
  final int weight;
  final int age;
  final String gender;
  final double bmiStatus;
  final int index;
  final DismissDirectionCallback onDismiss;
  // final DateTime createdAt;
  // final Timestamp createdAt;
  
  const History({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.bmiStatus, 
    required this.onDismiss, required this.index,
    // required this.index, required this.createdAt,
  });

  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismiss,
      background: Container(
        color: ColorManager.error,
        child:  const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      // key: ValueKey<int>(index),
      key: UniqueKey(),
      child: SizedBox(
        height: 290,
        width: double.infinity,
        child: Card(
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side:  BorderSide(color: inActiveColor, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenderContainerBox(
                          boxColor: gender == "Male" ? maleBoxColor : femaleBoxColor,
                          size: AppSize.s8,
                          childWidget: DataContainer(
                          icon: gender == "Male" ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
                          title: gender == "Male" ? AppStrings.male : AppStrings.female,
                          color:  gender == "Male" ? ColorManager.turquoise :  ColorManager.peach,
                          size: AppSize.s40,
                          ), 
                          onTap: () {  },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 62.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: inActiveColor, width: 1),
                              color: ColorManager.white,
                              
                            ),
                            padding:
                                const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                Text(AppStrings.age,
                                style: bodyText2.copyWith(color: ColorManager.deepBlue)),
                                const SizedBox(height: 5),
                                Text(age.toString(),
                                style: headline3.copyWith(color: ColorManager.deepBlue)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: inActiveColor, width: 1),
                              color: ColorManager.white,
                            ),
                            padding:
                                const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                Text(AppStrings.height,
                                  style: bodyText3.copyWith(color: ColorManager.deepBlue)),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      height.toString(),
                                        style: headline3.copyWith(color: ColorManager.deepBlue)),
                                    Text(
                                      " "+AppStrings.cm,
                                        style: headline3.copyWith(color: ColorManager.deepBlue)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: inActiveColor, width: 1),
                              color: ColorManager.white,
                            ),
                            padding:
                                const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                Text(AppStrings.weight,
                              style: bodyText3.copyWith(
                                  color: ColorManager.deepBlue)),
                                const SizedBox(height: 5),
                                Text(
                                  weight.toString(),
                                   style: headline3.copyWith(
                                  color: ColorManager.deepBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.grey[100],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: inActiveColor, width: 1),
                                color: ColorManager.white,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'BMI',
                                    style: bodyText3.copyWith(color: ColorManager.deepBlue)
                                  ),
                                  const SizedBox(height: 5),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        '${bmiStatus.toStringAsFixed(1)}',
                                        style: headline3.copyWith( color: ColorManager.deepBlue),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: inActiveColor, width: 1),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'STATUS',
                                    style: bodyText3.copyWith(color: ColorManager.deepBlue)
                                  ),
                                  // const SizedBox(height: 5),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        getInterpretation(bmiStatus),
                                        style: headline4.copyWith( color: ColorManager.deepBlue),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  ],
                ),
                
              ],
            )
          ),
        ),
      ),
    );
  }
}
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmi > 18.5) {
      return "You have normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight.You can eat a bit more now.";
    }
  }