import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_event.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_state.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_bloc.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_event.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:baking_app/Baking/repository/authentication/authentication_repository.dart';
import 'package:baking_app/Baking/repository/user/user_repository.dart';
import 'package:baking_app/Baking/view/widgets/user-widgets/user_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserProfileWrapped extends StatelessWidget {
  static const routeName = 'userEdit';

  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthenticationRepository>(context);
    final userRepository = RepositoryProvider.of<UserRepository>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Container(
      alignment: Alignment.center,
      child: BlocProvider<UserBloc>(
        create: (context) => UserBloc(userRepository: userRepository,authenticationBloc:authBloc ,authenticationRepository:authService ),
        child: UserProfileScreen(),
      ),
    );
  }
}


class UserProfileScreen extends StatefulWidget {


  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
   final formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  final TextEditingController _confirmPass = TextEditingController();
  var user=User(id:0, username:'',password:'',email:'');

 void onSave(BuildContext context ){
    print("againnnnnnnnnnnnnnnnn");
    print(user.email);
    print(user.password);
    print(user.username);
    formkey.currentState.save();
    BlocProvider.of<UserBloc>(context).add(UserUpdate(User(id:user.id,username: user.username,password:user.password ,email:user.email)));

     
     
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context,state){
        if(state is AuthenticationAuthenticated){
          user.id=state.user.id;
            return Scaffold(
              appBar: AppBar(backgroundColor:Color.fromRGBO(10, 56, 92, 1),actions: [ PopupMenuButton(
        onSelected: (value) {
          switch (value) {
            case 1:
              BlocProvider.of<AuthenticationBloc>(context).add(UserLoggedOut());
  
              break;
            case 2:
            BlocProvider.of<UserBloc>(context).add(UserDelete(state.user));
             
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
                      Text('Log out')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Text('Delete Acc')
                    ],
                  )),
            ])],),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              // BackButtonWidget(),
              SizedBox(
                height: 120,
              ),

              //  FlatButton(
              //     height: 50,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25),
              //         side: BorderSide(color: Colors.red)),
              //     onPressed: () {
              //       BlocProvider.of<UserBloc>(context).add(UserDelete(state.user));
              //     },
              //     //color: Theme.of(context).accentColor,
              //     textColor: Theme.of(context).accentColor,
              //     child: Text('Delete acc')),
                  //         FlatButton(
                  // height: 50,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(25),
                  //     side: BorderSide(color: Colors.red)),
                  // onPressed: () {
                  //   BlocProvider.of<AuthenticationBloc>(context).add(UserLoggedOut());
                  // },
                  // //color: Theme.of(context).accentColor,
                  // textColor: Theme.of(context).accentColor,
                  // child: Text('Log Out')),

              Text('Hey! ${state.user.username}',
                    style: Theme.of(context).textTheme.headline4),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              initialValue: state.user.username,
                              decoration: InputDecoration(
                                hintText: 'Username',
                          
             
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(247, 102, 94, 1)),
                                ),
                              ),
                            onSaved: (value) {
                      user.username = value;
                    },
                              validator: (String value) {
                                if (value.length < 5) {
                                  return 'Username must be atleast 5 characters long';
                                }
                                return null;
                              },
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.mail), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                                  initialValue: state.user.email,
                               onSaved: (value) {
                      user.email = value;
                    },
                              decoration: InputDecoration(
                                hintText: 'Email',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(247, 102, 94, 1)),
                                ),
                              ),
                              validator: (String value) {
                               
                                return null;
                              },
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.lock), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              controller: _pass,
                               onSaved: (value) {
                      user.password = value;
                    },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(247, 102, 94, 1)),
                                ),
                              ),
                              validator: (String value) {
                                if (value.length < 5) {
                                  return 'Password must be atleast 5 characters long';
                                }
                                return null;
                              },
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.lock), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              controller: _confirmPass,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(247, 102, 94, 1)),
                                ),
                              ),
                              validator: (String value) {
                                if (value.length < 5) {
                                  return 'Password must be atleast 5 characters long';
                                }
                                if (value != _pass.text) {
                                  return 'Password must match';
                                }
                                return null;
                              },
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {
                        bool valid = formkey.currentState.validate();
                        // ignore: unnecessary_statements
                        valid?onSave(context):(){};
                      },
                      color: Color.fromRGBO(247, 102, 94, 1),
                      child: Text(
                        'Submit Changes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
        }
        else{
          return Text('Not auth');
        }

    });
  }
}
