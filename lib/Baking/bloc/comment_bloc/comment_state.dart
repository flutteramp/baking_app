import 'package:baking_app/Baking/models/comment.dart';
import 'package:equatable/equatable.dart';

class CommentState extends Equatable{
  CommentState();

  @override
  List<Object> get props => [];
  
}

class CommentInitial extends CommentState{

}

class CommentSuccessfull extends CommentState{
  final List<Comment> comments;

  CommentSuccessfull([this.comments = const []]); 
   @override
  List<Object> get props => [comments];

}
class CommentInProgress extends CommentState{

}
class CommentFailure extends CommentState{
  
}