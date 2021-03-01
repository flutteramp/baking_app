import 'dart:io';

import 'package:baking_app/Baking/models/recipe.dart';
import 'package:equatable/equatable.dart';

abstract class RecipeEvent extends Equatable{
     const RecipeEvent();
}
class RecipeCreate extends RecipeEvent{
  final Recipe recipe;
  final File file;
  const RecipeCreate(this.recipe,this.file);

  @override
List<Object> get props => [recipe];
}
class RecipeRetrieve extends RecipeEvent{

  const RecipeRetrieve();

  @override
List<Object> get props => [];
}

class RecipeImageRetrieve extends RecipeEvent{

  const RecipeImageRetrieve();

  @override
List<Object> get props => [];
}
class UserRecipeRetrieve extends RecipeEvent{
  final int id;

  const UserRecipeRetrieve(this.id);

  @override
 List<Object> get props => [];
}
class RecipeUpdate extends RecipeEvent{
  final Recipe recipe;
    final int userID;
  const RecipeUpdate(this.recipe,this.userID);

  @override
 List<Object> get props => [recipe];
}

class UserRecipeDelete extends RecipeEvent{
  final int id;
   final int userID;
  const UserRecipeDelete(this.id,this.userID);

  @override
 List<Object> get props => [];
}