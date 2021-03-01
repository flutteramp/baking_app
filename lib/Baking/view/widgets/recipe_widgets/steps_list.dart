
import 'package:baking_app/Baking/bloc/recipe_state/step.state.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step_event.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/direction_item.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';



class StepsList extends StatelessWidget {
  final int id;

  const StepsList(this.id);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<StepBloc>(context).add(StepsRetrieve(id));
    return BlocBuilder<StepBloc, RecipeStepState>(builder: (_, state) {
       if (state is StepFailure) {
        return Text('Not Working');
      } else if (state is StepSuccessfull) {
        print('commnetsssss commming');
        final steps = state.steps.toList();
        print("length ${steps.length}");
      return ListView.builder(itemBuilder: (contex,i){
       return DirectionItem(steps[i],i+1);

             
      },
      itemCount: steps.length,);
      }
      return Center(child:CircularProgressIndicator());
  }
    
  )
  ;
}
}
