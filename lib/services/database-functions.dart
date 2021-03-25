import 'package:agriteck_admin/other-classes/useful-functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:flutter/material.dart';
Future<String> saveData(Community data)async{
  await Firebase.initializeApp();
  String results='pending';
  var db = FirebaseFirestore.instance;
  db.collection("Community").add(data.toMap())
      .then((docRef) => {
        results=docRef.id
      }).catchError((error){
        print('==================================================='+error.toString());
    results='error';
  });
  return results;
}

Future<Diseases> readDiseases()async{
  await Firebase.initializeApp();
  var db = FirebaseFirestore.instance;
  CollectionReference reference= db.collection("Community");
  reference.get().then((value){
  value.docs;
}).onError((error, stackTrace){
  print('===================================$error');
});


  return null;

}
