import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myisuct/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  String _login;
  String _password;

  Future<void> validateAndSubmit() async {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      print('Form is valid. Login: $_login, Password: $_password');
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _login, password: _password);
        //Navigator.of(context).pushNamed('/home');
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
      }
      catch(e)
       {
        print(e.message);
      }
    }
    else 
    {
      print('Form is invalid.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
            TextFormField(
              validator: (value) {
                if(value.isEmpty)
                  return 'Поле не может быть пустым!';
              },
              onSaved: (value) => _login = value, 
              controller: _usernameController,
              style: TextStyle(fontSize: 15.0,color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Номер студенческого',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if(value.length < 6)
                  return 'Номер слишком короткий!';
              },
              onSaved: (value) => _password = value,
              style: TextStyle(fontSize: 15.0,color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
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
                  onPressed: validateAndSubmit,
                )
              ],
            )
          ],
        ),
      )
    );
  }
}