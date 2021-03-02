import 'dart:convert';
import 'package:baking_app/Baking/models/comment.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../shared_preferences.dart';

class CommentDataProvider{
//  final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;

  CommentDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Comment>> getComments(int rid) async{
     print(rid);
    final response = await httpClient.get('$baseUrl/recipe/comments/$rid',
         headers: await SharedPrefUtils.getStringValuesSF().then((token){
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) );
    if (response.statusCode == 200) {
      final comments = jsonDecode(response.body) as List;
      return comments.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed');
    }

  }

    Future<void> deleteComment(int id) async {
    final http.Response response = await httpClient.delete(
      '$baseUrl/comments/delete/$id',
       headers: await SharedPrefUtils.getStringValuesSF().then((token){
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) ,
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete comment.');
    }
  }

  
  Future<Comment> createComment(Comment comment) async {
    final response = await httpClient.post(
      Uri.http(address, '/comments/new'),
          headers: await SharedPrefUtils.getStringValuesSF().then((token){
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) ,
      body: jsonEncode(<String, dynamic>{
        'userid': comment.userid,
        'recipeid': comment.recipeid,
        'message': comment.message,
        'username': comment.username,
      }),
    );
    print(response.statusCode);
        print(response.body);

    if (response.statusCode == 201) {
     // return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create comment.');
    }
  }


Future<void> updateComment(Comment comment) async {
    final http.Response response = await httpClient.put(
      '$baseUrl/comments/update/${comment.id}',
          headers: await SharedPrefUtils.getStringValuesSF().then((token){
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) ,
      body: jsonEncode(<String, dynamic>{
        'id': comment.id,
        'userid': comment.userid,
        'recipeid': comment.recipeid,
        'message': comment.message,
        'username': comment.username,
      }),
    );
 print('status code.${response.statusCode}');
    if (response.statusCode != 200) {
      throw Exception('Failed to update comment.');
    }
  }


}