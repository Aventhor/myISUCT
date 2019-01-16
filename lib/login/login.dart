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
            SizedBox(height: 70.0),
            Column(
              children: <Widget>[
                Image.asset('isuct_logo.png', width: 120.0, height: 120.0),
                SizedBox(height: 50.0),
                Text('Вход', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600))
              ],
            ),
            SizedBox(height: 50.0),
            TextField(
              controller: _usernameController,
              style: TextStyle(fontSize: 15.0,color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.contacts),
                hintText: 'Номер студенческого',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              style: TextStyle(fontSize: 15.0,color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.create),
                hintText: 'Номер паспорта',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Войти', style: TextStyle(color: Colors.white)),
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