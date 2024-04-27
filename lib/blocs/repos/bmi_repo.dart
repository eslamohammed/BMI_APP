import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
class BmiRepository{

  final _fireCloud = FirebaseFirestore.instance.collection("BMI_List");
  // post 
     Future<bool> addToBmiList(
    {
      required int gander,
      required int age,
      required int height,
      required int weight,
      required double bmi,
    }
  ) async{
    try{
      await _fireCloud.add({
        "gander" : gander,
        "height": height,
        "weight": weight,
        "age": age,
        "bmi": bmi,
      });
      return true;
    } on FirebaseException catch(e){
      if(kDebugMode){
        print("Failed with error ${e.code} ${e.message}");
      }
      // return false;
    }
    catch(e){
      throw Exception(e.toString());
    }
      return false;

  }


  //get 
  //Fetch bmi list
    Future<QuerySnapshot<Map<String, dynamic>>> fetchBmiList() async {
        return await FirebaseFirestore.instance.collection("BMI_List").get();

        // bmi.docs.forEach((element) {
        //   return bmi_List.add(BmiModel.fromJson(element.data()));
        // });
        // return bmi_List;
        
    }

/*
try{

        final bmi = await FirebaseFirestore.instance.collection("collectionPath").get();

        bmi.docs.forEach((element) {
          return bmi_List.add(BmiModel.fromJson(element.data()));
        });

        return bmi_List;

      } on FirebaseException catch(e){
        if(kDebugMode){
        print("Failed with error ${e.code} ${e.message}");
        }
      }
      catch(e){
        throw Exception(e.toString());
      } 
        return [];
 */

}
