import 'package:flutter/material.dart';

class CommentText extends StatelessWidget {
  final String message;

  const CommentText({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10),
      width: double.infinity,
     child: Text(this.message,textAlign: TextAlign.start,),
    );
  }
}