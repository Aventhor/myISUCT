import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Мой ИГХТУ"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.contacts),
            onPressed: () {},
          )
        ],
      ),
      drawer: new Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Trevor Widget'),
              accountEmail: const Text('trevor.widget@example.com'),
              currentAccountPicture: const CircleAvatar(),
            ),
            new ListTile(
              title: Text('Выйти'),
              leading: new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: () {},
                ),
              onTap: () {
              Navigator.of(context).pushNamed('/login');
              }
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
      ]
      ),
    );
  }
}