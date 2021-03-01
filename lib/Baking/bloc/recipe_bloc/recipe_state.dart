import 'package:baking_app/Baking/models/recipe.dart';
import 'package:equatable/equatable.dart';

class  RecipeState extends Equatable{
   
RecipeState();
 @override
  List<Object> get props => [];
} 

class RecipeSuccessfull extends RecipeState{
  final List<Recipe> recipes;
  final List<Recipe> userRecipes;
  RecipeSuccessfull([this.recipes=const [],this.userRecipes=const []]);
    @override
  List<Object> get props => [recipes,userRecipes];
}
class RecipeInProgress extends RecipeState{
    
  
}
class RecipeFailure extends RecipeState{
 
}