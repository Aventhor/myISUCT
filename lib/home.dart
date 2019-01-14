import 'package:flutter/material.dart';
import 'card/card.dart';
import 'schedule/schedule.dart';
import 'profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  SchedulePage schedule;
  MyCard news;
  ProfilePage profile;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    news = MyCard();
    schedule = SchedulePage();
    profile = ProfilePage();
    pages = [news, schedule, profile];

    currentPage = news;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("Мой ИГХТУ", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
        ],
      ),
      body: currentPage,
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        fixedColor: Colors.redAccent,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text("Новости"),
          
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          title: Text("Расписание"),
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.face),
          title: Text("Профиль"),
        )
      ],
      ),
    );
  }
}