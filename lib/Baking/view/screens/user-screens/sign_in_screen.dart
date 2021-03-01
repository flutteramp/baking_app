import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/login_bloc/login_bloc.dart';
import 'package:baking_app/Baking/bloc/login_bloc/login_event.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:baking_app/Baking/repository/authentication/authentication_repository.dart';
import 'package:baking_app/Baking/view/screens/user-screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthenticationRepository>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authBloc, authService),
        child: SignInScreen(),
      ),
    );
  }
}


class SignInScreen extends StatefulWidget {
  static String routeName = '/signin';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formkey = GlobalKey<FormState>();

   var user=User(username:'',password:'',email:'');

 void onSave(BuildContext context ){
    formkey.currentState.save();
    print('calling');
    BlocProvider.of<LoginBloc>(context).add(LoginInWithEmailButtonPressed(user:user));

     
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage('assets/images/sign.jpg'))),
              ),
                Text('Sign In',
                    style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
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
                                var emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'Email is not valid';
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
                                onSaved: (value) {
                      user.password = value;
                    },
                              obscureText: true,
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
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                       bool valid = formkey.currentState.validate();
                       print(valid);
                       valid?onSave(context):(){};
                      },
                      color: Color.fromRGBO(247, 102, 94, 1),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context,SignUpScreen.routeName);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(
                                color: Color.fromRGBO(247, 102, 94, 1),
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
