import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';

class History extends StatelessWidget {
  final double height;
  final double weight;
  final int age;
  final String gender;
  final double bmiStatus;
  final int index;
  final DismissDirectionCallback onDismiss;

  const History({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.bmiStatus,
    required this.onDismiss,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismiss,
      background: Container(
        color: ColorManager.error,
        child: Align(
          child: const Icon(
            FontAwesomeIcons.deleteLeft,
          ),
          alignment: Alignment.centerRight,
        ),
      ),
      key: ValueKey<int>(index),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: ColorManager.primary,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Height: $height cm',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Weight: $weight kg',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Age: $age',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Gender: $gender',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'BMI Status: ${bmiStatus.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
