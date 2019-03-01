import 'dart:async';

import 'package:flutter/material.dart';
import 'post/post_summary.dart';
import 'package:myisuct/model/news/post.dart';
import 'package:myisuct/controller/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPage extends StatefulWidget {
  @override
 _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List <Post> posts;

  DataService pl = new DataService();
  StreamSubscription<QuerySnapshot> postSub;


  void initState() {
    super.initState();

    posts = new List();

    postSub = pl.getPostList(database: 'news').listen((QuerySnapshot snapshot) {
      final List<Post> posts = snapshot.documents
          .map((documentSnapshot) => Post.fromMap(documentSnapshot.data))
          .toList(); 
      setState(() {
        this.posts = posts;
        print(posts.toString());
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
               itemBuilder: (BuildContext context, int index) => new PostSummary(posts[index]),
               itemCount: posts.length,
               reverse: true,
            )
          ),
        ]
      ),
    );
  }
}
