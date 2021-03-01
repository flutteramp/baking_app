import 'package:flutter/material.dart';

class User {
  int id;
  String username;
  String password;
  String email;

  User({this.id,@required this.username, @required this.password,  @required this.email});

 @override
  // TODO: implement props
  List<Object> get props => [id,username,password,email];


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      username: json['fullname'],
    );
  }

}

