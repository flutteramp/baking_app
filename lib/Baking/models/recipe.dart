import 'dart:convert';
import 'dart:io';

import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'ingredient.dart';

class Recipe extends Equatable {
  int id;
   String title;
   int servings;
   String duration;
   String imageurl;
   File image;
   int userID;
  List<Ingredient> ingredients;
  List<RecipeStep> steps;



  Recipe(
      {this.id,@required this.title, @required this.servings,this.imageurl, @required this.duration,this.userID,this.ingredients,this.steps,this.image});


  @override
  // TODO: implement props
  List<Object> get props => [id,title,servings,duration,userID];
//  List<Map> toJson(){
//     List<Map> ingredient=this.ingredients!=null? this.ingredients.map((ing) =>jsonEncode(ing));
//     return ingredient;
// }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      servings: json['servings'],
      duration: json['duration'],
      userID: json['recipeuserid']
 
    //  ingredients:List<Ingredient>.from(json["ingredients"].map((ingredient)=>ingredient))
    );
  }
//.map((ingredient) => Ingredient.fromJson(ingredient))
  @override
  String toString() => 'Recipe { id: $id, title: $title, servings: $servings, serving: $duration ,userid:$userID }';
}
