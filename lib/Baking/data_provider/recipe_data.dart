import 'dart:convert';
import 'dart:io';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences.dart';

class RecipeDataProvider{
  final _baseUrl = 'http://192.168.1.6:8181';
  final http.Client httpClient;
  RecipeDataProvider({@required this.httpClient}) : assert(httpClient != null);


  Future<List<Recipe>> getRecipes()async{

    final response = await httpClient.get('$_baseUrl/recipes',
     headers: await SharedPrefUtils.getStringValuesSF().then((token){
         print(token);
    return (<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
    }) 
    );
    print(response.statusCode);
    print("heeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    if (response.statusCode == 200) {
       await getRecipe(1 );
      final recipes = jsonDecode(response.body) as List;
      return recipes.map((recipe) {
        
       return Recipe.fromJson(recipe);
      }).toList();
     
    } else {
      throw Exception('Failed');
    }

  }

 Future<void> getRecipe(int id)async{
    final response = await httpClient.get('$_baseUrl/recipe/image/$id');
    print('satus coooooooooooooooooooooooooooooooooooooooooooooooooooo');
    print(response.statusCode);
    if (response.statusCode == 200) {
      
        
      // return Recipe.fromJson(jsonDecode(response.body));
     
      
    } else {
      throw Exception('Failed');
    }

  }



    Future<List<Recipe>> getUserRecipes(int id)async{
    final response = await httpClient.get('$_baseUrl/user/$id/recipes');
    print('satus coooooooooooooooooooooooooooooooooooooooooooooooooooo');
    print(response.statusCode);
    if (response.statusCode == 200) {
       
      final recipes = jsonDecode(response.body) as List;
      return recipes.map((recipe) {
        
       return Recipe.fromJson(recipe);
      }).toList();
     
    } else {
      throw Exception('Failed');
    }

  }
      Future<void> deleteRecipe(int id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/recipes/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete recipe.');
    }
  }
 


  
  Future<Recipe> createRecipe(Recipe recipe) async {  
    print("my file"+recipe.image.toString());
    final response = await httpClient.post(

      Uri.http('192.168.1.6:8181', '/recipes/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
       
      body: jsonEncode(<String, dynamic>{
        'title': recipe.title,
        'servings': recipe.servings,
        'duration': recipe.duration,
        'recipeuserid':recipe.userID,
         'ingredients':recipe.ingredients.map((ingredient) {
             return <String,dynamic>{
                "title":ingredient.name,
                "quantity":ingredient.quantity,
                "measurment":ingredient.measurment
            };
         }).toList(),
         'steps':recipe.steps.map((step) {
             return <String,dynamic>{
                "direction":step.direction,
               
            };
         }).toList(),
        // 'ingredients':recipe.ingredients,
        
      }),
    );
       print("shhhhhhhh");
     print("ppppppppppppppppppppppppppppppppppppppppppppppp");
    print(response.statusCode);
        print(response.body);

    if (response.statusCode == 201) {
              final recipet=Recipe.fromJson(jsonDecode(response.body));
    //await UploadImageRecipe(recipet.id,recipe.image);
      return recipet;
    } else {
      throw Exception('Failed to create recipe.');
    }
    
  }

  Future<void> UploadImageRecipe(int recipeId,File file) async {  
    Dio dio= Dio();
    print("pleeeeeeeeeeeeeeeeeeeeeeee");
    print(recipeId);
    print("sure");
        print("file "+file.toString());
      String fileName = file.path.split('/').last;
     // print("file "+file.toString());
    FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(file.path, filename:fileName),
    });
    dio.options.headers["id"] = recipeId;
    
    var response = await dio.post("http://192.168.1.6:8181/recipes/newImage/${recipeId}", data: formData,queryParameters:{"id":recipeId});
    print("rsponnnnnnnnnnnnnnnnnn");
    

  }

Future<void> updateRecipe(Recipe recipe) async {
  print("recpe id ${recipe.id}");
    final http.Response response = await httpClient.put(
      '$_baseUrl/recipes/update/${recipe.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, dynamic>{
        'title': recipe.title,
        'servings': recipe.servings,
        'duration': recipe.duration,
         'ingredients':recipe.ingredients.map((ingredient) {
             return <String,dynamic>{
                "title":ingredient.name,
                "quantity":ingredient.quantity,
                "measurment":ingredient.measurment
            };
         }).toList(),
         'steps':recipe.steps.map((step) {
             return <String,dynamic>{
                "direction":step.direction,
               
            };
         }).toList(),
       
        
      }),
    );
    print("works");
    print("image "+response.statusCode.toString());
    if (response.statusCode != 200) {
      throw Exception('Failed to update recipe.');
    }
  }


  }
  