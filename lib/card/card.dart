import 'package:flutter/material.dart';
import 'card_page.dart';

class MyCard extends StatelessWidget {
  List cards = new List.generate(5, (i) => new CustomCard()).toList();
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white70,
      child: ListView(
        children: cards,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white70,
      child: new Card(
        child: new InkWell(
          onTap: () {  
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => CardPage()),
            );
          },
        child: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                children: <Widget> [
                  new Image.network('http://isuct.ru/sites/default/files/common/mainphoto1.jpg'),            
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                children: <Widget>[
                new Text(
                  'Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT', 
                  style: Theme.of(context).textTheme.subtitle,
                ),
                ]
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(7.0),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.all(7.0),
                    child: new Icon(Icons.arrow_forward),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(7.0),
                    child: new Text('Подробнее',
                    style: TextStyle(fontSize: 17.0),
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    ),
    );
  }
}