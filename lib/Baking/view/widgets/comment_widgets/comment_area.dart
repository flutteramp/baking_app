import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_state.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/models/comment.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentArea extends StatefulWidget {
  final Recipe recipe;

  const CommentArea({@required this.recipe});
  @override
  _CommentAreaState createState() => _CommentAreaState();
}

class _CommentAreaState extends State<CommentArea> {
  var comment = Comment(message: '', userid: 0, recipeid:0 , username: '');
  final _form = GlobalKey<FormState>();

  void onSave(BuildContext context) {
    _form.currentState.save();
    print(comment.toString());
    BlocProvider.of<CommentBloc>(context).add(CommentCreate(comment));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationAuthenticated) {
        comment.recipeid=widget.recipe.id;
        comment.userid = state.user.id;
        comment.username = state.user.username;
        return Container(
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Container(
                height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(17),
                  child: TextFormField(
                      maxLines: 2,
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter your comment here"),
                      onSaved: (value) {
                        comment.message = value;
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  alignment: AlignmentDirectional.topEnd,
                  child: FlatButton(
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {
                        onSave(context);
                      },
                      //  color: Theme.of(context).accentColor,
                      textColor: Colors.black87,
                      child: Text('Comment')),
                )
              ],
            ),
          ),
        );
      }
      else{
        return Text('Not authenticated');
      }
    });
  }
}
