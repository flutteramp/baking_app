import 'dart:convert';


import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../shared_preferences.dart';


class StepDataProvider{
 // final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;

  StepDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<RecipeStep>> getSteps(int rid) async{
     print(rid);
    final response = await httpClient.get('$baseUrl/recipes/$rid/steps',
         headers: await SharedPrefUtils.getStringValuesSF().then((token){
         print(token);
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) );
    if (response.statusCode == 200) {
      final steps = jsonDecode(response.body) as List;
      return steps.map((step) => RecipeStep.fromJson(step)).toList();
    } else {
      throw Exception('Failed');
    }

  }



}