
import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:equatable/equatable.dart';

class RecipeStepState extends Equatable{
RecipeStepState();

  @override
  List<Object> get props => [];
  
}

class StepInitial extends RecipeStepState{

}

class StepSuccessfull extends RecipeStepState{
  final List<RecipeStep> steps;

StepSuccessfull([this.steps = const []]); 
   @override
  List<Object> get props => [steps];

}
class StepInProgress extends RecipeStepState{

}
class StepFailure extends RecipeStepState{
  
}