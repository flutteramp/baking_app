


import 'package:baking_app/Baking/models/comment.dart';
import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable{
  const CommentEvent();
}
class CommentCreate extends CommentEvent{
  final Comment comment;

 const CommentCreate(this.comment);

  @override
  List<Object> get props => [comment];

}

class CommentRetrieve extends CommentEvent{
  final int recipeId;
 const CommentRetrieve(this.recipeId);
  @override
  List<Object> get props => [];

}
class CommentUpdate extends CommentEvent{
  final Comment comment;
  const CommentUpdate(this.comment);
  @override
 List<Object> get props => [comment];
}
class CommentDelete extends CommentEvent{
  final Comment comment;
  const CommentDelete(this.comment);

  @override
  List<Object> get props => [comment];

}