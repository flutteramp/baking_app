import 'package:baking_app/Baking/models/comment.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_text.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_user_name.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final User user;
  const CommentItem({Key key, @required this.comment,@required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(20),
      child:Column(
        children:[
          CommentUserName(comment:comment,user:user),
          CommentText(message:comment.message),
        ]
      )
    );
  }







}