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
  bool _isLoading = false;

  Future<void> validateAndSubmit() async {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
        setState(() {
          _isLoading = true;
        });
      print('Form is valid. Login: $_login, Password: $_password');
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _login, password: _password);
        //Navigator.of(context).pushNamed('/home');
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
      }
      catch(e)
       {
        print(e.message);
        setState(() {
          _isLoading = false;
        });
      }
    }
    else 
    {
      print('Form is invalid.');
    }
  }

  Widget _showCircularProgress(){
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } return Container(height: 0.0, width: 0.0,);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
             image: NetworkImage('https://i.pinimg.com/originals/17/8e/39/178e39bfa4290fec229ea6e0e12899fb.jpg'),
             fit: BoxFit.cover,
          ),
        ),
        child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(50.0),
            child:
              Text('Вход', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600)),
            ),
            TextFormField(
              validator: (value) {
                if(value.isEmpty)
                  return 'Поле не может быть пустым!';
              },
              onSaved: (value) => _login = value, 
              controller: _usernameController,
              style: TextStyle(fontSize: 15.0,color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey[600])
                ),
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
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: RaisedButton(
                  child: Text('Войти', style: TextStyle(color: Colors.white)),
                  elevation: 6.0,
                  onPressed: validateAndSubmit,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child:
            _showCircularProgress(),
            ),
          ],
        ),
      )
    ),
    ),
    );
  }
}