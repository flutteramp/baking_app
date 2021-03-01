import 'package:baking_app/Baking/data_provider/comment_data.dart';
import 'package:baking_app/Baking/models/comment.dart';
import 'package:flutter/material.dart';

class CommentRepository{
  final CommentDataProvider dataProvider;
  CommentRepository({@required this.dataProvider})
      : assert(dataProvider != null);

Future<List<Comment>> getComments(int rid) async {
    return await dataProvider.getComments(rid);
  }

    Future<Comment> createComment(Comment comment) async {

    return await dataProvider.createComment(comment);
  }

  
  Future<void> updateComment(Comment comment) async {
    
    await dataProvider.updateComment(comment);
  }

  Future<void> deleteComment(int id) async {
    await dataProvider.deleteComment(id);
  }

}