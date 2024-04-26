part of 'bmi_bloc.dart';

abstract class BmiEvent {}

class BmiInitialEvent extends BmiEvent {
  final String gander;
  final double age;
  final double hight;
  final double weight;
  final double bmi;

  BmiInitialEvent({
    required this.gander, 
    required this.age, 
    required this.hight, 
    required this.weight, 
    required this.bmi});
}


// abstract class BmiEvent extends Equatable {
//   const BmiEvent();

//   @override
//   List<Object> get props => [];
// }

// class  AddBmi extends BmiEvent{
//   final Bmi bmi;
//   const AddBmi(this.bmi);

//   @override
//   List<Object> get props => [bmi]; 
// }

// class  UpdateBmi extends BmiEvent{
//   final Bmi bmi;
//   const UpdateBmi(this.bmi);

//   @override
//   List<Object> get props => [bmi]; 
// }

// class  DeleteBmi extends BmiEvent{
//   final Bmi bmi;
//   const DeleteBmi(this.bmi);

//   @override
//   List<Object> get props => [bmi]; 
// }

