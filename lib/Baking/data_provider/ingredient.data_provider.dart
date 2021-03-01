import 'dart:convert';

import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IngredientDataProvider{
  final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;

  IngredientDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Ingredient>> getingredients(int rid) async{
     print(rid);
    final response = await httpClient.get('$_baseUrl/ingredients/$rid');
    print('getttinggg commmeeentnnntsssss');
    if (response.statusCode == 200) {
      final ingredients = jsonDecode(response.body) as List;
      return ingredients.map((ingredient) => Ingredient.fromJson(ingredient)).toList();
    } else {
      throw Exception('Failed');
    }

  }



}