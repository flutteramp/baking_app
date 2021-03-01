import 'package:equatable/equatable.dart';

class Ingredient extends Equatable{
  final int id;
  final String name;
  final int quantity;
  final String measurment;

  Ingredient({this.id,this.name, this.quantity, this.measurment});
    @override
  // TODO: implement props
  List<Object> get props => [id,name,quantity,measurment];

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['title'],
      quantity: json['quantity'],
      measurment: json['measurment'],
    );
  }
}

