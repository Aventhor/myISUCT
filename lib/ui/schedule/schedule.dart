import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'day_detail.dart';
import 'package:myisuct/controller/data_service.dart';
import 'package:myisuct/model/schedule/schedule.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DataService ds = new DataService();
  StreamSubscription<QuerySnapshot> postSub;
  List<Lesson> schedule;

  void initState() {
    super.initState();

    schedule = new List();

    postSub = ds.getScheduleList().listen((QuerySnapshot snapshot) {
      final List<Lesson> schedule = snapshot.documents
          .map((documentSnapshot) => Lesson.fromMap(documentSnapshot.data))
          .toList(); 
      setState(() {
        this.schedule = schedule;
      });
    });
    print(schedule.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => new DayDetail(schedule),
              itemCount: schedule.length,
            )
          ),
        ],
      ),
    );
  }
}