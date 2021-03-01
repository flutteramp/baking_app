import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:flutter/material.dart';
import '../../../models/recipe.dart';
class AddDirectionItem extends StatelessWidget {
  final int step;
 final Recipe recipe;
 final int index;

  const AddDirectionItem( this.step,this.recipe,this.index) ;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Step $step'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.multiline,
            initialValue:index!=-1?recipe.steps[index].direction:"",
            minLines: 2,
            maxLines: 5,
            onSaved: (value){
              if(index==-1){
             recipe.steps.add(RecipeStep(id:1,direction:value));
              }
              else{
                 recipe.steps[index]=RecipeStep(id:1,direction:value);
              }
              print("value "+value);
              
            },
          ),
        ),
      ],
    ));
  }
}
