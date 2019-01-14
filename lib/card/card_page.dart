import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget image = new Container(
      child:
        Image.network('http://isuct.ru/sites/default/files/common/mainphoto1.jpg',
        scale: 0.1,
        ),
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
    );

    Widget subtitle = new Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        'Новость дня',
        style: Theme.of(context).textTheme.title,
      ),
    );

    Widget middleSection = new Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
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
            subtitle,
            middleSection,
          ],
        )
      )
    );
  }
}