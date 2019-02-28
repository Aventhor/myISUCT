import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class LoginControl {
  static final LoginControl instance = new LoginControl._internal();

  factory LoginControl() {
    return instance;
  }
  LoginControl._internal();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseUser user;
  final formKey = new GlobalKey<FormState>();

  Future<FirebaseUser> getUser() async {
    return await firebaseAuth.currentUser();
  }

  Future<bool> checkLogIn() async{
    bool isLogIn = false;
    user = await getUser().then((u) {
      if(u != null) {
        isLogIn = true;
      }
      else {
        isLogIn = false;
      }
    });
    return isLogIn;
  }
  void test() {
    firebaseAuth.onAuthStateChanged.listen((user) {
      
          print('AUTH');
    });
  }
    Future<bool> validateAndSubmit(String login, String pass) async {
    final form = formKey.currentState;
    bool isValid = false;
    if(form.validate()) {
      form.save();
      print('Form is valid. Login: $login, Password: $pass');
      try {
        user = await firebaseAuth.signInWithEmailAndPassword(email: login, password: pass);
        isValid = true;
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
    return isValid;
  }
}