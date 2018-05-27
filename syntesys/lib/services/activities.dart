import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class ActivityData{
  // final String displayName;
  final String id;
  final String uid;
  // final String email;

  // ActivityData(this.displayName, this.id, this.email);
  ActivityData(this.id, this.uid);
}

class ActivitiesModel{
  CollectionReference get activities => Firestore.instance.collection('android');
  DocumentReference get data => Firestore.instance.collection('android').document('uid');
  final formatter = new DateFormat("dd MMM yyyy");

  Future<List<ActivityData>> getAllActivities() async{
    QuerySnapshot snapshot = await  activities.getDocuments();
    checkToday();
    List<ActivityData> activityList = snapshot.documents.map((document){
      // return new ActivityData(document["displayName"], document.documentID, document["email"]);
      return new ActivityData(document.documentID, document["uid"]);
    }).toList();
    return activityList;
  }

  void checkToday() {
  
  }
}