import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_state.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_area.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_item.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreen extends StatelessWidget {
  final Recipe recipe;
  const CommentScreen({@required this.recipe});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if(state is AuthenticationAuthenticated){
               return SingleChildScrollView(
        child: Column(
          children: [
            CommentArea(recipe:recipe),
            CommentList(user:state.user,recipe:recipe),
          ],
        ),
      );

          }
          else{
            return Text('Not Auth');
          }
     
    });
  }
}
