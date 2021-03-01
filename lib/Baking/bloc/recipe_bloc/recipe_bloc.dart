import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/repository/recipe/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;
  
   RecipeBloc({@required this.recipeRepository})
      : assert(recipeRepository != null),
        super(RecipeInProgress());

List<Recipe> time = [];
  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {

    if (event is RecipeCreate) {
      yield RecipeInProgress();
      try {
        await recipeRepository.createRecipe(event.recipe);
       
       final recipe = await recipeRepository.getRecipes();
       print("checkkkkkkkkkkkkkkkkkkkkkkk");
        yield RecipeSuccessfull(recipe);
           print("kjjjjjjjjjjjjjjjjjjjj");
      } catch (e) {
        print(e);
            
        yield RecipeFailure();
      }
    }
    if( event is RecipeRetrieve){

      yield RecipeInProgress();
       try {
       final recipes = await recipeRepository.getRecipes();

        yield RecipeSuccessfull(recipes);

      } catch ( error) {
        
        print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
        yield RecipeFailure();
      }
    }
      if( event is UserRecipeRetrieve){

      yield RecipeInProgress();
       try {
       final userRecipes = await recipeRepository.getUserRecipes(event.id);
       final recipes=await recipeRepository.getRecipes();

        yield RecipeSuccessfull(recipes,userRecipes);

      } catch ( error) {
        
        print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
        yield RecipeFailure();
      }
    }
      if( event is UserRecipeDelete){
      yield RecipeInProgress();
       try {
         await recipeRepository.deleteRecipe(event.id);
       final userRecipes = await recipeRepository.getUserRecipes(event.userID);
         final recipes=await recipeRepository.getRecipes();

        yield RecipeSuccessfull(recipes,userRecipes);
       
       
      } catch ( error) {
        
        print(error);
        yield RecipeFailure();
      }
    }
     
    if(event is RecipeImageRetrieve){
            yield RecipeInProgress();
       try {
      // final image = await recipeRepository.getRecipe();
      
        final recipes = await recipeRepository.getRecipes();
       
        yield RecipeSuccessfull(recipes);
    
        
      } catch ( error) {
        
        print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
        yield RecipeFailure();
      }
    }
       if( event is RecipeUpdate){
    
      yield RecipeInProgress();
       try {
       await recipeRepository.updateRecipe(event.recipe);
         final userRecipes = await recipeRepository.getUserRecipes(event.userID);
         final recipes=await recipeRepository.getRecipes();

        yield RecipeSuccessfull(recipes,userRecipes);
        
      } catch ( error) {
        
     
        yield RecipeFailure();
      }
    }

  }
}
