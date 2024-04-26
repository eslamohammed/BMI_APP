import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/presentation/utils/strings_manager.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';
import 'package:ibm_task/widget/custom_button.dart';
import '../../widget/container_box.dart';
import 'data_container.dart';

// final activeColor = Colors.cyan.shade800;
final activeColor = ColorManager.primary;
const inActiveColor = Color(0xFF212121);
// final inActiveColor = ColorManager.darkGrey;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = AppSize.s180 as int;
  int weight = AppSize.s70 as int;
  int age = AppSize.s20 as int;
  String result = "";
  String resultDetail = "";
  double bmi = 0;

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

  String calculateBmi(int weight, int height) {
    bmi = weight / pow(height / AppSize.s180, AppSize.s2);
    return bmi.toStringAsFixed(AppSize.s1 as int);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: maleBoxColor,
                    childWidget: const DataContainer(
                        icon: FontAwesomeIcons.mars, title: AppStrings.male),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: ContainerBox(
                      boxColor: femaleBoxColor,
                      childWidget: const DataContainer(
                          icon: FontAwesomeIcons.venus, title:AppStrings.female)),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(AppStrings.height, style: textStyle1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: textStyle2),
                      const Text(AppStrings.cm, style: textStyle1),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: Colors.grey.shade800,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                    boxColor: inActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(AppStrings.weight, style: textStyle1),
                        Text(weight.toString(), style: textStyle2),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    }
                                  });
                                })
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: ContainerBox(
                    boxColor: inActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(AppStrings.age, style: textStyle1),
                        Text(age.toString(), style: textStyle2),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                                backgroundColor: activeColor,
                                child: const Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    }
                                  });
                                })
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("To view your BMI History"),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.historyPage);
                  },
                  child: Text(
                    AppStrings.history,
                    style: TextStyle(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Container(margin:EdgeInsets.all(AppMargin.m16),child: CustomButton(label: AppStrings.calculate, callbackAction: () {}))
        ],
      ),
    );
  }
}
