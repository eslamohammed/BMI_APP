
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/bmi.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent,BmiState>{
  BmiBloc():super(const BmiState()){
   on<AddBmi>(_onAddBmi); 
   on<UpdateBmi>(_onUpdateBmi); 
   on<DeleteBmi>(_onDeleteBmi); 
  }

  void _onAddBmi(AddBmi event, Emitter<BmiState> emit) {
    final state = this.state;
    emit(
      BmiState(
        allBmi: List.from(state.allBmi)..add(event.bmi),
      )
    );
  }

  void _onUpdateBmi(UpdateBmi event, Emitter<BmiState> emit) {
  }

  void _onDeleteBmi(DeleteBmi event, Emitter<BmiState> emit) {
  }
}