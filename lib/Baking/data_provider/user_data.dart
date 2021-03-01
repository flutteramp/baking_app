import 'dart:convert';
import 'package:baking_app/Baking/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class UserDataProvider{

// final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);
  
  Future<void> createUser(User user) async {
    final response = await httpClient.post(

      Uri.http(address, '/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'fullname': user.username,
        'password': user.password,
        'email': user.email,

      }),
    );
     print("ppppppppppppppppppppppppppppppppppppppppppppppp");
    print(response.statusCode);
        print(response.body);

    if (response.statusCode == 201) {
     // return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create comment.');
    }
  }


    Future<void> deleteUser(int id) async {
    final response = await httpClient.delete(
      '$baseUrl/users/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete comment.');
    }
  }

  


Future<void> updateUser(User user) async {
    final response = await httpClient.put(
      '$baseUrl/users/update/${user.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': user.id,
        'fullname': user.username,
        'password': user.password,
        'email': user.email,
      }),
    );
 print('status code.${response.statusCode}');
    if (response.statusCode != 200) {
      throw Exception('Failed to update comment.');
    }
  }




}