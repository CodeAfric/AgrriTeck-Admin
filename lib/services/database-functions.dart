import 'dart:async';
import 'dart:io';
import 'package:agriteck_admin/other-classes/useful-functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DatabaseServices {
  static Future<String> saveDataa(String collection, var data) async {
    await Firebase.initializeApp();
    String results = 'pending';
    var db = FirebaseFirestore.instance;
    db
        .collection("Community")
        .add(data.toMap())
        .then((docRef) => {results = docRef.id})
        .catchError((error) {
      print('===================================================' +
          error.toString());
      results = 'error';
    });
    return results;
  }

  static Future<String> uploadFarmPic(File image, String userID) async {
    firebase_storage.Reference reference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('Images')
        .child('Farms')
        .child(userID)
        .child(image.path);
    firebase_storage.TaskSnapshot storageTaskSnapshot =
        await reference.putFile(image);
    final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  static Future<void> save(
    String id,
    var data,
  ) async {
    FirebaseFirestore.instance.collection("Farms").doc(id).set(data.toMap());
  }

  static Future<String> saveData(String collection, var data) async {
    await Firebase.initializeApp();
    String results = 'pending';
    var db = FirebaseFirestore.instance;
    db
        .collection(collection)
        .add(data.toMap())
        .then((docRef) => {results = docRef.id})
        .catchError((error) {
      print('===================================================' +
          error.toString());
      results = 'error';
    });
    return results;
  }

  static Future<Diseases> readDiseases() async {
    await Firebase.initializeApp();
    var db = FirebaseFirestore.instance;
    CollectionReference reference = db.collection("Community");
    reference.get().then((value) {
      value.docs;
    }).onError((error, stackTrace) {
      print('===================================$error');
    });
    return null;
  }
}
