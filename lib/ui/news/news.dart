import 'dart:async';

import 'package:flutter/material.dart';
import 'post/post_summary.dart';
import 'package:myisuct/model/news/post.dart';
import 'package:myisuct/controller/news/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPage extends StatefulWidget {
  @override
 _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List <Post> posts;
  List <Post> reversedList; 

  PostList pl = new PostList();
  StreamSubscription<QuerySnapshot> postSub;


  void initState() {
    super.initState();

    posts = new List();
    reversedList = new List();

    postSub = pl.getPostList().listen((QuerySnapshot snapshot) {
      final List<Post> posts = snapshot.documents
          .map((documentSnapshot) => Post.fromMap(documentSnapshot.data))
          .toList(); 
      setState(() {
        this.posts = posts;
        reversedList = posts.reversed.toList();
      });
    });
  }

  @override 
    Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
               itemBuilder: (BuildContext context, int index) => new PostSummary(reversedList[index]),
               itemCount: reversedList.length,
            )
          ),
        ]
      ),
    );
  }
}
