import 'package:equatable/equatable.dart';

class RecipeStep extends Equatable{
  final int id;
  final String direction;


  RecipeStep({this.id,this.direction});
    @override
  // TODO: implement props
  List<Object> get props => [id,direction];

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      id: json['id'],
      direction: json['direction'],

    );
  }
}

