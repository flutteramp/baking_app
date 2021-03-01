import 'package:baking_app/Baking/data_provider/user_data.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:flutter/material.dart';

class UserRepository{

  final UserDataProvider dataProvider;
  UserRepository({@required this.dataProvider})
      : assert(dataProvider != null);


    Future<void> createUser(User user) async {

  await dataProvider.createUser(user);
  }

  
  Future<void> updateUser(User comment) async {
    
    await dataProvider.updateUser(comment);
  }

  Future<void> deleteUser(int id) async {
    await dataProvider.deleteUser(id);
  }





}