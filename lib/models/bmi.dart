


class BmiModel {
  
  final  String gander;
  final  double hight;
  final double weight;
  final double age;
  final double bmi;

  BmiModel({
    required this.gander,
    required this.hight,
    required this.weight,
    required this.age,
    required this.bmi,
  });

  factory BmiModel.fromJson(Map<String,dynamic> json) =>  BmiModel(
      gander: json["gander"], 
      hight: json["hight"], 
      weight: json["weight"], 
      age: json["age"], 
      bmi: json["bmi"]);
  

    Map<String, dynamic> toJson() => {
    "gander" : gander,
    "hight": hight,
    "weight": weight,
    "age": age,
    "bmi": bmi,
    };
}