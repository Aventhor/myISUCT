import 'package:flutter/material.dart';
import 'package:myisuct/ui/home.dart';
import 'package:myisuct/controller/login/login_control.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginControl lControl = LoginControl.instance;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void checkData() async {
    setState(() {
      _isLoading = true;
    });
    bool isValid = await lControl.validateAndSubmit(_usernameController.text, _passwordController.text);
    if(isValid) {
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  Widget _showCircularProgress(){
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(height: 0.0, width: 0.0,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
             image: NetworkImage(''),
             fit: BoxFit.cover,
          ),
        ),
        child: Form(
        key: lControl.formKey,
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
              //onSaved: (value) => _login = value, 
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
              //onSaved: (value) => _password = value,
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
                  onPressed: checkData,
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