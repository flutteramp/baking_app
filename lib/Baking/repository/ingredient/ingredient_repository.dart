import 'package:baking_app/Baking/data_provider/ingredient.data_provider.dart';

import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientRepository{
  final IngredientDataProvider dataProvider;
  IngredientRepository({@required this.dataProvider})
      : assert(dataProvider != null);

Future<List<Ingredient>> getIngredients(int rid) async {
    return await dataProvider.getingredients(rid);
  }

   

}