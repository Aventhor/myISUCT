class Account {

  String _login;
  String _password;
  int _course;
  int _group;

  Account(
    this._login, this._password, this._course, this._group
  );

  String get login => _login;
  String get password => _password;
  int get course => _course;
  int get group => _group;

  Account.map(dynamic obj) {
    this._login = obj['login'];
    this._password = obj['password'];
    this._course = obj['course'];
    this._group = obj['group'];
  }

  Account.fromMap(Map<String, dynamic> map) {
    this._login = map['login'];
    this._password = map['password'];
    this._course = map['course'];
    this._group = map['group'];
  }
}