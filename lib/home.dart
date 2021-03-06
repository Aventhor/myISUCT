import 'package:flutter/material.dart';
import 'news/news.dart';
import 'schedule/schedule.dart';
import 'profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  SchedulePage schedule;
  NewsPage news;
  ProfilePage profile;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    news = NewsPage();
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
              accountName: const Text(
                'Egor Krasuhin',
                textAlign: TextAlign.right,
                style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                ),
              ),
              accountEmail: const Text(
                'krasuhin.number.one@isuct.ru',
                style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: 
                  NetworkImage('https://www.isuct.ru/sites/default/files/department/ightu/ightu/16062017/isuct_logo_0.png'),
              ),
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