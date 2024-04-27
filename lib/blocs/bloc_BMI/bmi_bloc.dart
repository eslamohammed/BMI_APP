import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ibm_task/blocs/repos/bmi_repo.dart';

import '../../models/bmi.dart';

part 'bmi_event.dart';

part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial()) {
    on<BmiInitialEvent>(bmiInitialAddBmi);

    on<FetchBMIEvent>(bmiInitialFetchBmi);
    //
    // on<BmiInitialEvent>(bmiInitialDeleteBmi);
  }

  List<BmiModel> bmiList = [];

  //Post to firebase
  FutureOr<void> bmiInitialAddBmi(
      BmiInitialEvent event, Emitter<BmiState> emit) async {
    emit(BmiLoadingState());

    bool success = await BmiRepository().addToBmiList(
        gander: event.gander,
        age: event.age,
        height: event.hight,
        weight: event.weight,
        bmi: event.bmi);

    if (success) {
      emit((BmiAddSuccessfulState()));
    } else {
      emit(BmiErrorState());
    }
  }

  //Get from firebase
  Future<void> bmiInitialFetchBmi(
      FetchBMIEvent event, Emitter<BmiState> emit) async {
    emit(BmiLoadingState());
    try {
      final bmi = await BmiRepository().fetchBmiList();
      for (var element in bmi.docs) {
        bmiList.add(BmiModel.fromJson(element.data()));
      }
      emit(BmiFetchSuccessfulState(bmiList: bmiList));
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code} ${e.message}");
      }
      emit(BmiErrorState());
    } catch (e) {
      emit(BmiErrorState());
      log(e.toString());
    }
  }
}

//   //Delete from firebase
//   FutureOr<void> bmiInitialDeleteBmi(
//       BmiInitialEvent event, Emitter<BmiState> emit) {}
// }
/*
Future<void> bmiInitialFetchBmi(BmiInitialEvent event, Emitter<BmiState> emit) async{
    emit(BmiLoadingState());

    List <BmiModel> bmi_List = await BmiRepository().fetchBmiList();
    emit(BmiFetchSuccessfulState(bmiList: bmi_List));
  }

 */
