import 'package:flutter/material.dart';
import 'splashscreen/splashscreen.dart';
import 'login/login.dart';

class MyISUCTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мой ИГХТУ',
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage()
      },
      //initialRoute: '/login',
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
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white30,
    textSelectionColor: Colors.yellow,
    errorColor: Colors.red,
    textTheme: _buildisuctTextTheme(base.textTheme),
    primaryTextTheme: _buildisuctTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildisuctTextTheme(base.accentTextTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    )
  );
}
TextTheme _buildisuctTextTheme(TextTheme base) {
  return base.copyWith(
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