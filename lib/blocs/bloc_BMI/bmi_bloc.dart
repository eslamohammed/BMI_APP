
import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ibm_task/blocs/repos/bmi_repo.dart';

import '../../models/bmi.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent,BmiState>{

  BmiBloc():super(BmiInitial()){

   on<BmiInitialEvent>(bmiInitialAddBmi); 

   on<BmiInitialEvent>(bmiInitialFetchBmi);

   on<BmiInitialEvent>(bmiInitialDeleteBmi);

  }
  //Post to firebase
  FutureOr<void> bmiInitialAddBmi(BmiInitialEvent event, Emitter<BmiState> emit) async{
    emit(BmiLoadingState());
    
    bool success = await BmiRepository().addToBmiList(
      gander: event.gander, 
      age: event.age, 
      hight: event.hight, 
      weight: event.weight, 
      bmi: event.bmi
    );

    if(success){
      emit((BmiAddSuccessfulState()));
    } else {
      emit(BmiErrorState());
    }
  }

  //Get from firebase
  Future<void> bmiInitialFetchBmi(BmiInitialEvent event, Emitter<BmiState> emit) async{
    emit(BmiLoadingState());

    List <BmiModel> bmi_List =[];
    try{
      final bmi = await BmiRepository().fetchBmiList();
        bmi.docs.forEach((element) {
          return bmi_List.add(BmiModel.fromJson(element.data()));
        });
        if (bmi_List.isNotEmpty) {
          emit(BmiFetchSuccessfulState(bmiList: bmi_List));    
        }else{
          emit(BmiEmptyState());
        }
      } on FirebaseException catch(e){
        if(kDebugMode){
        print("Faild with error ${e.code} ${e.message}");
        }
        emit(BmiErrorState());
      }
      catch(e){
        emit(BmiErrorState());
        log(e.toString());
      } 
  }
  //Delete from firebase
  FutureOr<void> bmiInitialDeleteBmi(BmiInitialEvent event, Emitter<BmiState> emit) {
  }
}
/*
Future<void> bmiInitialFetchBmi(BmiInitialEvent event, Emitter<BmiState> emit) async{
    emit(BmiLoadingState());

    List <BmiModel> bmi_List = await BmiRepository().fetchBmiList();
    emit(BmiFetchSuccessfulState(bmiList: bmi_List));
  }

 */