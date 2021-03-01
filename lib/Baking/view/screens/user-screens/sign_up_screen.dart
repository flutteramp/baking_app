import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_bloc.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_event.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_state.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:baking_app/Baking/repository/authentication/authentication_repository.dart';
import 'package:baking_app/Baking/repository/user/user_repository.dart';
import 'package:baking_app/Baking/view/screens/user-screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupWrapped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = RepositoryProvider.of<AuthenticationRepository>(context);
    final userRepository = RepositoryProvider.of<UserRepository>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Container(
      alignment: Alignment.center,
      child: BlocProvider<UserBloc>(
        create: (context) => UserBloc(userRepository: userRepository,authenticationBloc:authBloc ,authenticationRepository:authService ),
        child: SignUpScreen(),
      ),
    );
  }
}


class SignUpScreen extends StatefulWidget {
    static String routeName = '/signup';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  var user=User(username:'',password:'',email:'');

 void onSave(BuildContext context ){
    print("againnnnnnnnnnnnnnnnn");
    print(user.email);
    print(user.password);
    print(user.username);
    formkey.currentState.save();
    BlocProvider.of<UserBloc>(context).add(UserCreate(user));
           Navigator.pop(context);

    
     
     
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
                height: 180,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage('assets/images/sign.jpg'))),
              ),
                Text('Sign Up',
                    style: Theme.of(context).textTheme.headline4),
              // BackButtonWidget(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              
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
                              obscureText: true,
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
                              obscureText: true,
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
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width:double.infinity,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {
                        bool valid = formkey.currentState.validate();
                        // ignore: unnecessary_statements
                        valid?onSave(context):(){};
                      },
                      color: Color.fromRGBO(247, 102, 94, 1),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'SIGN IN',
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

// class BackButtonWidget extends StatelessWidget {
//   const BackButtonWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       // decoration: BoxDecoration(
//       //     image: DecorationImage(
//       //         fit: BoxFit.cover, image: AssetImage('assets/images/sign.jpg'))),
//       child: Positioned(
//           child: Stack(
//         children: <Widget>[
//           Positioned(
//               top: 20,
//               child: Row(
//                 children: <Widget>[
//                   IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       }),
//                   Text(
//                     'Back',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       shadows: <Shadow>[
//                         Shadow(
//                           offset: Offset(1.0, 1.0),
//                           blurRadius: 3.0,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                         Shadow(
//                           offset: Offset(2.0, 2.0),
//                           blurRadius: 8.0,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               )),
//           Positioned(
//             bottom: 20,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Create New Account',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w900,
//                   fontSize: 28,
//                   shadows: <Shadow>[
//                     Shadow(
//                       offset: Offset(1.0, 1.0),
//                       blurRadius: 3.0,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                     Shadow(
//                       offset: Offset(2.0, 2.0),
//                       blurRadius: 8.0,
//                       color: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
