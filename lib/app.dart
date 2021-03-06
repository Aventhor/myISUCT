import 'package:flutter/material.dart';
import 'splashscreen/splashscreen.dart';
import 'login/login.dart';
import 'home.dart';
import 'card/card_page.dart';

class MyISUCTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мой ИГХТУ',
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new HomePage(),
        '/card_page': (BuildContext context) => new CardPage(),
      },
      onGenerateRoute: _getRoute,
      theme: _isuctTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if(settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}
final ThemeData _isuctTheme = _buildisuctTheme();

ThemeData _buildisuctTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.redAccent,
    accentColor: Colors.redAccent,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Colors.redAccent,
      textTheme: ButtonTextTheme.normal,
      minWidth: 120.0,
      height: 45.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    ),
    hintColor: Colors.grey[100],
    scaffoldBackgroundColor: Colors.white,
    textSelectionColor: Colors.yellow,
    errorColor: Colors.red,
    textTheme: _buildisuctTextTheme(base.textTheme),
    primaryTextTheme: _buildisuctTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildisuctTextTheme(base.accentTextTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)),
        filled: true,
    )
  );
}

TextTheme _buildisuctTextTheme(TextTheme base) {
  return base.copyWith(
    display1: base.display1.copyWith(
      fontSize: 18.0,
    ),
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    displayColor: Colors.black,
    bodyColor: Colors.black,
  );
}