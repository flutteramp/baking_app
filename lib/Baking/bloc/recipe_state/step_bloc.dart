
import 'package:baking_app/Baking/bloc/recipe_state/step.state.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step_event.dart';

import 'package:baking_app/Baking/repository/recipe_state/step_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StepBloc extends Bloc<StepEvent,RecipeStepState>{
  final StepRepository stepRepository;
  StepBloc({@required this.stepRepository}):assert(stepRepository!=null), super(StepInProgress());
  @override
  Stream<RecipeStepState> mapEventToState(StepEvent event) async*{
    if(event is StepsRetrieve){
      yield StepInProgress();
      try{
      final steps = await stepRepository.dataProvider.getSteps(event.recipeId);
      yield StepSuccessfull(steps);
      print("ingredients");
    }catch(_){
      print("failed");
      yield StepFailure();
    }
    }

  
    

  }
  
} 