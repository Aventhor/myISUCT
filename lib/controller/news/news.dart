import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

  // Access a Cloud Firestore instance from your Activity
  Firestore db = Firestore.instance;
class PostList {
  // Reference to a Collection
  CollectionReference postCollectionRef = db.collection('news');

  Stream<QuerySnapshot> getPostList({int offset, int limit}) {
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