
import 'package:baking_app/Baking/repository/ingredient/ingredient_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ingredient.state.dart';
import 'ingredient_event.dart';

class IngredientBloc extends Bloc<IngredientEvent,IngredientState>{
  final IngredientRepository ingredientRepository;
  IngredientBloc({@required this.ingredientRepository}):assert(ingredientRepository!=null), super(IngredientInProgress());
  @override
  Stream<IngredientState> mapEventToState(IngredientEvent event) async*{
    if(event is IngredientsRetrieve){
      yield IngredientInProgress();
      try{
      final ingredients = await ingredientRepository.getIngredients(event.recipeId);
      yield IngredientSuccessfull(ingredients);
      print("ingredients");
    }catch(_){
      print("failed");
      yield IngredientFailure();
    }
    }

  
    

  }
  
} 