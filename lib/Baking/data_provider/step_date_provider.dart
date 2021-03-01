import 'dart:convert';


import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class StepDataProvider{
  final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;

  StepDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<RecipeStep>> getSteps(int rid) async{
     print(rid);
    final response = await httpClient.get('$_baseUrl/steps/$rid');
    print('getttinggg stepppppppppps');
    if (response.statusCode == 200) {
      final steps = jsonDecode(response.body) as List;
      return steps.map((step) => RecipeStep.fromJson(step)).toList();
    } else {
      throw Exception('Failed');
    }

  }



}