import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('images/isuct_logo.png', width: 120.0, height: 120.0),
                SizedBox(height: 20.0),
                Text('Мой ИГХТУ')
              ],
            ),
            SizedBox(height: 100.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Номер студенческого',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Номер паспорта',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Отмена'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('Войти'),
                  elevation: 6.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                )
              ],
            )
          ],
        ),
      )
    );
  }
}