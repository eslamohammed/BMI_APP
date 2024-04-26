import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';

class History extends StatelessWidget {
  final double height;
  final double weight;
  final int age;
  final String gender;
  final String bmiStatus;

  const History({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.bmiStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              'BMI Status: $bmiStatus',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}