
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ibm_task/models/bmi.dart';

class BmiRepository{

  final _fireCloud = FirebaseFirestore.instance.collection("BMI_List");
  // post 
     Future<bool> addToBmiList(
    {
      required String gander,
      required double age,
      required double hight,
      required double weight,
      required double bmi,
    }
  ) async{
    try{
      await _fireCloud.add({
        "gander" : gander,
        "hight": hight,
        "weight": weight,
        "age": age,
        "bmi": bmi,
      });
      return true;
    } on FirebaseException catch(e){
      if(kDebugMode){
        print("Faild with error ${e.code} ${e.message}");
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
    Future<QuerySnapshot<Map<String, dynamic>>> fetchBmiList() async{
      List <BmiModel> bmi_List = [];

        return await FirebaseFirestore.instance.collection("collectionPath").get();

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
        print("Faild with error ${e.code} ${e.message}");
        }
      }
      catch(e){
        throw Exception(e.toString());
      } 
        return [];
 */



  //   static Future<List<BmiModel>> fetchBmiList() async{
  //   var client = http.Client();
  //   List<BmiModel> bmiList= [];
  //   // final msg = jsonEncode(
  //   //   {
  //   //     "pageNumber": pageNumber,
  //   //     "pageSize": pageSize,
  //   //     "isFavourite": isFavourite,
  //   //   }
  //   // );
  //   try { 
  //     var response = await client.post(
  //       Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetFilterPagination'),
  //       // headers: {
  //       //   "Authorization": "Bearer ${SessionManagement.getUserToken()}",
  //       //   'Content-Type': 'application/json-patch+json; charset=UTF-8',
  //       //   },
  //       // body: msg
  //     );       

  //       if (response.statusCode == 200) {

  //       Map<String, dynamic> result = jsonDecode(response.body);

  //       List favourateData = result['Data'];


  //       for (int i = 0 ; i < favourateData.length ; i++ ){
  //         BmiModel favorite = BmiModel.fromJson(favourateData[i]);// as Map<String, dynamic>
  //         bmiList.add(favorite);
  //       }
  //       return bmiList;

  //       } else{
  //         print("Errrrrrrrrrrror !${response.body}");
  //       }
  //     return bmiList ;
  //     } catch (e) {
  //       log(e.toString());
  //       return [];
  //   }     
  // }

}
