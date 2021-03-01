import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPopupMenu extends StatefulWidget {
  final Comment comment;

  const CommentPopupMenu({Key key, @required this.comment}) : super(key: key);

  @override
  _CommentPopupMenuState createState() => _CommentPopupMenuState();
}

class _CommentPopupMenuState extends State<CommentPopupMenu> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  
    return PopupMenuButton(
        onSelected: (value) {
          switch (value) {
            case 1:
              print('editt');
              _displayTextInputDialog(context);
              break;
            case 2:
              FocusScope.of(context).requestFocus(new FocusNode());
              BlocProvider.of<CommentBloc>(context)
                  .add(CommentDelete(widget.comment));
              print('deleteee');
              break;
            default:
              break;
          }
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.edit),
                      ),
                      Text('Edit')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.delete),
                      ),
                      Text('Delete')
                    ],
                  )),
            ]);
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    String newMessage = '';
    void onSave(BuildContext context) {
      _form.currentState.save();

      BlocProvider.of<CommentBloc>(context).add(CommentUpdate(Comment(
        message: newMessage,
        username: widget.comment.username,
        id: widget.comment.id,
        recipeid: widget.comment.recipeid,
        userid: widget.comment.userid,
      )));
    }

    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: _form,
            child: AlertDialog(
              title: Text('Edit Comment'),
              content: TextFormField(
                initialValue: widget.comment.message,
                onSaved: (value) {
                  newMessage = value;
                },
                decoration: InputDecoration(hintText: "New Comment"),
              ),
              actions: <Widget>[
                FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('CANCEL'),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
                FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text('OK'),
                  onPressed: () {
                    onSave(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
