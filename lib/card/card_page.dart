import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white70,
        child: Column(
        children: <Widget> [
          new Image.network('http://isuct.ru/sites/default/files/common/mainphoto1.jpg'),
          new Text(
            'Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT Random Text of ISUCT', 
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }
}