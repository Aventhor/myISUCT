import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("myISUCT"),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.contacts),
          onPressed: () {},
        )
      ],
    ),
    drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Text("Drawer Header"),
            decoration: new BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),

    bottomNavigationBar: new BottomNavigationBar(items: [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.chat),
        title: new Text("Новости"),
      ),

      new BottomNavigationBarItem(
        icon: new Icon(Icons.event),
        title: new Text("Расписание"),
      ),

      new BottomNavigationBarItem(
        icon: new Icon(Icons.face),
        title: new Text("Профиль"),
      )
    ]),
  ),
));