import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

  Firestore db = Firestore.instance;

class DataService {

  Stream<QuerySnapshot> getPostList({int offset, int limit, String database}) {

    CollectionReference postCollectionRef = db.collection(database);

    Stream<QuerySnapshot> snapshots = postCollectionRef.snapshots();
  
    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
  
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
  
    return snapshots;
  }
  Stream<QuerySnapshot> getScheduleList({int offset, int limit}) {

    CollectionReference postCollectionRef = db.collection('schedule').document('2').collection('187').document('2').collection('Friday');

    Stream<QuerySnapshot> snapshots = postCollectionRef.snapshots();
  
    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
  
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
  
    return snapshots;
  }
}