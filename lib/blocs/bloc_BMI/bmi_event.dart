part of 'bmi_bloc.dart';

abstract class BmiEvent {}

class BmiInitialEvent extends BmiEvent {
  final int gander;
  final int age;
  final int hight;
  final int weight;
  final double bmi;

  BmiInitialEvent({
    required this.gander, 
    required this.age, 
    required this.hight, 
    required this.weight, 
    required this.bmi});
}
class FetchBMIEvent extends BmiEvent{}


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

