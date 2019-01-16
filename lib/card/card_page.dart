import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget image = new Container(
      child:
        Image.network('http://isuct.ru/sites/default/files/common/mainphoto1.jpg',
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
        'Новость дня',
        style: Theme.of(context).textTheme.title,
      ),
    );

    Widget middleSection = new Container(
      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT'),
          Text('Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT'),
          Text('Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT'),
          Text('Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT'),
          Text('Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT'),
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