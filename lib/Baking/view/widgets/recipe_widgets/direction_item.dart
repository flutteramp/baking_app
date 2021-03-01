
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:flutter/material.dart';

class DirectionItem extends StatelessWidget {
  final RecipeStep step;
  final int index;

  const DirectionItem(this.step,this.index);

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$index. ${step.direction}",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height:10),
        ],
      ),
    );
  }
}
