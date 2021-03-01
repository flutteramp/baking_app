import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({Key key, this.ingredient}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(ingredient.name,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(
            "${ingredient.quantity} ${ingredient.measurment}",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
