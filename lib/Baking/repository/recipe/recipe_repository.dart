import 'dart:io';

import 'package:baking_app/Baking/data_provider/recipe_data.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeRepository{
  final RecipeDataProvider dataProvider;
  RecipeRepository({@required this.dataProvider})
      : assert(dataProvider != null);

Future<List<Recipe>> getRecipes() async {print('getttttttttttttttttttttt');

    return await dataProvider.getRecipes();
  }

    Future<Recipe> createRecipe(Recipe recipe) async {
    return await dataProvider.createRecipe(recipe);

  }


      Future<List<Recipe>> getUserRecipes(int id)async{
   
     return await dataProvider.getUserRecipes(id);
  }
  Future<void> deleteRecipe(int id) async {
    await dataProvider.deleteRecipe(id);
  }
 Future<void> getRecipe(int id)async{
     await dataProvider.getRecipe(id);
  }
 
  
  Future<void> updateRecipe(Recipe recipe) async {
    await dataProvider.updateRecipe(recipe);
  }



}