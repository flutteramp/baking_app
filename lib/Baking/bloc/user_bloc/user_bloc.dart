import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_event.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_event.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_state.dart';
import 'package:baking_app/Baking/repository/authentication/authentication_repository.dart';
import 'package:baking_app/Baking/repository/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  final AuthenticationRepository authenticationRepository;

  UserBloc({@required this.authenticationBloc,@required this.userRepository,@required this.authenticationRepository})
      : assert(authenticationBloc != null||authenticationRepository != null||authenticationRepository != null),super(UserInProgress());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{

    if(event is UserCreate){
       print('fired user create');

      try {
        await userRepository.createUser(event.user);
        //final comments = await commentRepository.getComments(event.comment.recipeid);
        yield UserSuccessfull();
      } catch (e) {
        print(e);
        print("hhhhhhht");
        yield UserFailure();
      }

    }

      if (event is UserDelete) {
      try {
        int id = event.user.id;
        await userRepository.deleteUser(id);
        authenticationBloc.add(UserLoggedOut());
        yield UserSuccessfull();
      } catch (_) {
        yield UserFailure();
      }
    }
    if(event is UserUpdate){
       int id = event.user.id;
        print(id);
        try {
        await userRepository.updateUser(event.user);
        final user = await authenticationRepository.getUser(id);
       print('fefefefefefefefefefeefe');
        authenticationBloc.add(UserLoggedIn(user: user));
        yield UserSuccessfull(user);
        print('commne sucesssssss');
      } catch (_) {
        yield UserFailure();
      }
    }
    

  }
  
} 