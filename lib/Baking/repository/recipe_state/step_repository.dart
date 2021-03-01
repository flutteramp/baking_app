import 'package:baking_app/Baking/data_provider/step_date_provider.dart';
import 'package:baking_app/Baking/models/recipe_step.dart';


import 'package:flutter/material.dart';

class StepRepository{
  final StepDataProvider dataProvider;
  StepRepository({@required this.dataProvider})
      : assert(dataProvider != null);

Future<List<RecipeStep>> getSteps(int rid) async {
    return await dataProvider.getSteps(rid);
  }

   

}