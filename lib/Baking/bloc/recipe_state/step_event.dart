



import 'package:equatable/equatable.dart';

abstract class StepEvent extends Equatable{
  const StepEvent();
}




class StepsRetrieve extends StepEvent{
  final int recipeId;
 const StepsRetrieve(this.recipeId);
  @override
  List<Object> get props => [];

}

