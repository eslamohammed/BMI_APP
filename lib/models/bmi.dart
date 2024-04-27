


// import 'package:cloud_firestore/cloud_firestore.dart';

class BmiModel {
  
  final  int gander;
  final  int height;
  final int weight;
  final int age;
  final double bmi;
  // final DateTime createdAt ; 
  // final Timestamp createdAt ; 

  BmiModel( {
    required this.gander,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
    // required this.createdAt,
  });

  factory BmiModel.fromJson(Map<String,dynamic> json) =>  BmiModel(
      gander: json["gander"]??0,
      height: json["height"]??0,
      weight: json["weight"]??0,
      age: json["age"]??0,
      bmi: json["bmi"]??0.0,
      // createdAt: json["createdAt"]??DateTime.now(),
      );
  

    Map<String, dynamic> toJson() => {
    "gander" : gander,
    "height": height,
    "weight": weight,
    "age": age,
    "bmi": bmi,
    // "createdAt": createdAt,
    };
}