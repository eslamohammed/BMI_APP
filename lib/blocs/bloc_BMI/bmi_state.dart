part of 'bmi_bloc.dart';


class BmiState extends Equatable {
  final List <Bmi> allBmi;
  const BmiState({
    this.allBmi = const <Bmi>[],
  });

  @override
  List<Object> get props => [allBmi];
}