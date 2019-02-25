import 'package:flutter/material.dart';
import 'package:myisuct/model/news/post.dart';

class DetailPage extends StatelessWidget {

  final Post post;

  DetailPage(this.post);

  @override
  Widget build(BuildContext context) {

    Widget image = new Container(
      child:
        Image.network(post.imageLink,
        scale: 0.1,
        ),
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.all(0),
    );

    Widget date = new Container(
      padding: EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '20.01.19',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]
            ),
          )
        ],
      ),
      );

    Widget subtitle = new Container(
      padding: EdgeInsets.only(left: 20.0, top: 0, right: 20.0, bottom: 20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        post.title,
        style: Theme.of(context).textTheme.title,
      ),
    );

    Widget middleSection = new Container(
      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(post.body),
        ],
      ),
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text("Назад",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            image,
            date,
            subtitle,
            middleSection,
          ],
        )
      )
    );
  }
}