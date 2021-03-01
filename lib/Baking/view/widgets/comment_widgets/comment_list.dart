import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_state.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentList extends StatelessWidget {
  final User user;
  final Recipe recipe;

  const CommentList({@required this.user, @required this.recipe});
  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CommentBloc>(context).add(CommentRetrieve(recipe.id));

    return BlocBuilder<CommentBloc, CommentState>(builder: (_, state) {
      if (state is CommentFailure) {
        return Text('Not Working');
      } else if (state is CommentSuccessfull) {
        final comments = state.comments.reversed.toList();
        return (Container(
          child: Column(
            children: [...comments.map((comment)=>CommentItem(comment:comment,user:user)).toList()],
          ),
          // child: ListView.builder(
          //   itemCount: comments.length,
          //   itemBuilder: (context, index) {
          //     return CommentItem(comment:comments[index]);
          //   },
          // ),
        ));
      }
      return Center(child:CircularProgressIndicator());
    });
  }
}
