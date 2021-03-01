import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient.state.dart';
import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient_event.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import './ingredients_items.dart';

class IngredientsList extends StatelessWidget {
  final int id;

  const IngredientsList(this.id);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IngredientBloc>(context).add(IngredientsRetrieve(id));
    return BlocBuilder<IngredientBloc, IngredientState>(builder: (_, state) {
       if (state is IngredientFailure) {
        return Text('Not Working');
      } else if (state is IngredientSuccessfull) {
        print('commnetsssss commming');
        final ingredients = state.ingredients.toList();
        print("length ${ingredients.length}");
      return ListView.builder(itemBuilder: (contex,i){
       return IngredientItem(key:Key(ingredients[i].id.toString()),ingredient:ingredients[i]);

             
      },
      itemCount: ingredients.length,);
      }
      return Center(child:CircularProgressIndicator());
  }
    
  )
  ;
}
}
