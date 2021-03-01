import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/repository/comment/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent,CommentState>{
  final CommentRepository commentRepository;
  CommentBloc({@required this.commentRepository}):assert(commentRepository!=null), super(CommentInProgress());
  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async*{
    if(event is CommentRetrieve){
      yield CommentInProgress();
      try{
      final comments = await commentRepository.getComments(event.recipeId);
      yield CommentSuccessfull(comments);
    }catch(_){
      yield CommentFailure();
    }
    }

    if(event is CommentCreate){
       print('fired comment create');

      try {
        await commentRepository.createComment(event.comment);
 

        print(event.comment.recipeid);
       final comments = await commentRepository.getComments(event.comment.recipeid);
        yield CommentSuccessfull(comments);
      } catch (_) {
        yield CommentFailure();
      }

    }

      if (event is CommentDelete) {
      try {
        int rid = event.comment.recipeid;
        await commentRepository.deleteComment(event.comment.id);
        final comments = await commentRepository.getComments(rid);
        yield CommentSuccessfull(comments);
      } catch (_) {
        yield CommentFailure();
      }
    }
    if(event is CommentUpdate){
       int rid = event.comment.recipeid;
        print(rid);
        try {
        await commentRepository.updateComment(event.comment);
       final comments = await commentRepository.getComments(rid);
       print('fefefefefefefefefefeefe');
        yield CommentSuccessfull(comments);
        print('commne sucesssssss');
      } catch (_) {
        yield CommentFailure();
      }
    }
    

  }
  
} 