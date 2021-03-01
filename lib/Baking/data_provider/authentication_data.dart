import 'dart:convert';

import 'package:baking_app/Baking/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences.dart';
import 'package:baking_app/Baking/shared_preferences.dart';

class AuthenticationDataProvider{
  final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;

  AuthenticationDataProvider({@required this.httpClient}) : assert(httpClient != null);
  
  
  
  Future<User> getCurrentUser()async{
    print(":::::::::::::::::::::::::::::::::::::::::::::::::::::");

   return await SharedPrefUtils.getStringValuesSF().then((token)async{
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print('token is');
    print(payload['sessionId']);
    final response = await httpClient.get('$_baseUrl/users/${payload['sessionId']}');
    print(response.statusCode);
    if (response.statusCode == 200) {
    print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to retrieve user.');
    }



    });

     


  }


  Future<String> signInWithEmailAndPassword(User user) async{
    print("yesssssssssssssss");
       final response = await httpClient.post(
      Uri.http('192.168.1.6:8181', '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
      body: jsonEncode(<String, dynamic>{
        'password':user.password,
        'email':user.email
       
      }),
    );

    print(response.statusCode);
      print("Nooooooooooo");
        final jwt = jsonDecode(response.body);
         print(jwt);
        final token = jwt['token'];
        SharedPrefUtils.addStringToSF(token);
        
        print(token);
        Map<String, dynamic> payload = Jwt.parseJwt(token);

        print(payload);

    if (response.statusCode == 201) {
      return payload['sessionId'];
    } else {
      throw Exception('Failed to retrieve user.');
    }
  }


 Future<User> getUser(int id) async{
    final response = await httpClient.get('$_baseUrl/users/$id');
    if (response.statusCode == 200) {
    
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to retrieve user.');
    }
  
  }



  }