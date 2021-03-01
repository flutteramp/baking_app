
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Comment extends Equatable{
  int id;
  int userid;
  int recipeid;
  String message;
  String username;
  Comment({this.id,@required this.message,this.recipeid,this.userid,this.username});

  @override
  // TODO: implement props
  List<Object> get props => [id,userid,recipeid,message,username];

  
factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userid: json['userid'],
      recipeid: json['recipeid'],
      message: json['message'],
      username: json['username'],
    );
  }

  @override
  String toString() => 'Comment { id: $id, userid: $userid, recipeid: $recipeid, message: $message, username: $username }';

}