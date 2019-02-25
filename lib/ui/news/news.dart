import 'package:flutter/material.dart';
import 'post/post_summary.dart';
import 'package:myisuct/model/news/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPage extends StatefulWidget {
  @override
 _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

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
            )
          ),
        ]
      ),
    );
  }
}
