
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:equatable/equatable.dart';

class IngredientState extends Equatable{
IngredientState();

  @override
  List<Object> get props => [];
  
}

class IngredientInitial extends IngredientState{

}

class IngredientSuccessfull extends IngredientState{
  final List<Ingredient> ingredients;

IngredientSuccessfull([this.ingredients = const []]); 
   @override
  List<Object> get props => [ingredients];

}
class IngredientInProgress extends IngredientState{

}
class IngredientFailure extends IngredientState{
  
}