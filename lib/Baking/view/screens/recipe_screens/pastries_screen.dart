
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/add_recipe_screen.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/pastery_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../baking_route.dart';
import 'add_recipe_screen.dart';

class PastriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pastries',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        
        builder: (_, state) {
        
        if(state is RecipeFailure){
          return Text("not working");
        }
        else if(state is RecipeSuccessfull){
          final recipes=state.recipes;
        return SingleChildScrollView(
                  child: Container(
              color: Color.fromRGBO(125, 125, 125, 0.1),
              child: Column(
              children:  recipes.map((recipe) =>  PasteryItem(recipe)).toList()
              )),
        );
        }
           return Center(child: CircularProgressIndicator());
      }
 
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddRecipeScreen.routeName,arguments: RecipeArgument(recipe: null,add: true));
        },
      ),
    );

  }
}
