import 'package:cloud_firestore/cloud_firestore.dart';

class Post {

  int _id;
  String _title;
  String _body;
  String _imageLink;
  Timestamp _date;

  Post(
    this._id ,this._title, this._body, this._imageLink, this._date
  );

  Post.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._body = obj['body'];
    this._imageLink = obj['imageLink'];
    this._date = obj['date'];
  }

  int get id => _id;
  String get title => _title;
  String get body => _body;
  String get imageLink => _imageLink;
  Timestamp get date => _date;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['body'] = _body;
    map['imageLink'] =_imageLink;
    map['date'] =_date;
 
    return map;
  }

  Post.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._body = map['body'];
    this._imageLink = map['imageLink'];
    this._date = map['date'];
  }

}