

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ibm_task/models/bmi.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/presentation/utils/styles_manager.dart';
import 'package:ibm_task/presentation/utils/values_manager.dart';
import 'package:ibm_task/widget/historyWidget.dart';

class PaginatedHistoryPage extends StatelessWidget {
   PaginatedHistoryPage({super.key});

  final queryBmi_List = FirebaseFirestore.instance
  .collection('BMI_List')
  .orderBy('createdAt',descending:true)
  .withConverter<BmiModel>(
    fromFirestore: (snapshot, _) => BmiModel.fromJson(snapshot.data()!), 
    toFirestore: (user, _) => user.toJson(),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Text(
            'Your BMI History 📃',
            style: headline2.copyWith(color: ColorManager.deepBlue),
          ),
          elevation: AppSize.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.lightPrimary,
              statusBarBrightness: Brightness.light),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ColorManager.deepBlue,
              ))),
      backgroundColor: ColorManager.white,
      body: FirestoreQueryBuilder<BmiModel>(
        query: queryBmi_List,
        pageSize: 10,
        builder: (context,snapshot,_){
          return  ListView.builder(
            itemCount: snapshot.docs.length,
            itemBuilder: (BuildContext context, int index){
              final hasEndReached = snapshot.hasMore && index + 1 == snapshot.docs.length && !snapshot.isFetchingMore;

              if(hasEndReached){
                snapshot.fetchMore();
              }
              return History(
                height: snapshot.docs[index].data().height,
                weight: snapshot.docs[index].data().weight,
                gender: snapshot.docs[index].data().gander == 1 ? "Male" : "Female",
                age: snapshot.docs[index].data().age,
                bmiStatus: snapshot.docs[index].data().bmi,
                onDismiss: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    snapshot.docs.removeAt(index);
                    // DELETE EVENT
                  }
                },
                index: index,
              );
            }
          );
        },
      )
    );
  }
}