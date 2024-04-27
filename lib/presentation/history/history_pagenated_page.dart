

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:ibm_task/models/bmi.dart';

// class PaginatedHistoryPage extends StatefulWidget {
//   const PaginatedHistoryPage({super.key});

//   @override
//   State<PaginatedHistoryPage> createState() => _PaginatedHistoryPageState();
// }

// class _PaginatedHistoryPageState extends State<PaginatedHistoryPage> {

//   @override
//   void initState() {
//     super.initState();

//     uploadRandom();
//   }

//   void uploadRandom() async {
//   final _fireCloud = FirebaseFirestore.instance.collection("BMI_List");
//   final bmi_List = List.generate(500, (index) => index +1);

//     for (final bmi in bmi_List){
//       final bmi_data = BmiModel(
//         gander: gander,
//         height: height, 
//         weight: weight, 
//         age: age, 
//         bmi: bmi);

//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }