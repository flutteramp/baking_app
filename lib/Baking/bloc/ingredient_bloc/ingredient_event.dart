



import 'package:equatable/equatable.dart';

abstract class IngredientEvent extends Equatable{
  const IngredientEvent();
}




class IngredientsRetrieve extends IngredientEvent{
  final int recipeId;
 const IngredientsRetrieve(this.recipeId);
  @override
  List<Object> get props => [];

}

