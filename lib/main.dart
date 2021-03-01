import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_state.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step_bloc.dart';

import 'package:baking_app/Baking/data_provider/authentication_data.dart';
import 'package:baking_app/Baking/data_provider/comment_data.dart';
import 'package:baking_app/Baking/data_provider/recipe_data.dart';
import 'package:baking_app/Baking/data_provider/step_date_provider.dart';
import 'package:baking_app/Baking/data_provider/user_data.dart';

import 'package:baking_app/Baking/repository/comment/comment_repository.dart';
import 'package:baking_app/Baking/repository/ingredient/ingredient_repository.dart';
import 'package:baking_app/Baking/repository/recipe/recipe_repository.dart';
import 'package:baking_app/Baking/repository/recipe_state/step_repository.dart';
import 'package:baking_app/Baking/repository/user/user_repository.dart';

import 'package:baking_app/Baking/view/screens/baking_route.dart';
import 'package:baking_app/Baking/view/screens/user-screens/sign_in_screen.dart';
import 'package:baking_app/tabsNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'Baking/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:http/http.dart' as http;

import 'Baking/bloc/user_bloc/user_bloc.dart';
import 'Baking/data_provider/ingredient.data_provider.dart';
import 'Baking/repository/authentication/authentication_repository.dart';


// void sharedPrefInit() async {
//     try {
//         /// Checks if shared preference exist
//         Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//         final SharedPreferences prefs = await _prefs;
//         prefs.getString("token");
//     } catch (err) {
//         /// setMockInitialValues initiates shared preference
//         /// Adds app-name 
//         SharedPreferences.setMockInitialValues({});
//         Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//         final SharedPreferences prefs = await _prefs;
//         prefs.setString("token", "");
//     }
// }


void main() {
  //sharedPrefInit();

final AuthenticationRepository authenticationRepository=AuthenticationRepository(
   dataProvider: AuthenticationDataProvider(
      httpClient: http.Client(),
    ),
);

  final UserRepository userRepository = UserRepository(
     dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );

  final RecipeRepository recipeRepository = RecipeRepository(
    dataProvider: RecipeDataProvider(
      httpClient: http.Client(),
    ),
  );
  // final UserRecipeRepository userRecipeRepository = UserRecipeRepository(
  //   dataProvider: UserRecipeDataProvider(
  //     httpClient: http.Client(),
  //   ),
  // );
  final CommentRepository commentRepository = CommentRepository(
    dataProvider: CommentDataProvider(
      httpClient: http.Client(),
    ),
  );
  final IngredientRepository ingredientRepository = IngredientRepository(
    dataProvider: IngredientDataProvider(
      httpClient: http.Client(),
    ),
  );
    final StepRepository stepRepository = StepRepository(
    dataProvider: StepDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      recipeRepository: recipeRepository,
      commentRepository: commentRepository,
      ingredientRepository: ingredientRepository,
      stepRepository: stepRepository,
      userRepository:userRepository,
      authenticationRepository: authenticationRepository,
      //userRecipeRepository: userRecipeRepository,
    ),
    // BlocProvider(

    //   create: (context)=>RecipeBloc()..add(RecipeRetrieve()),
    //   child: MyApp(),

    // ),
  );
}

class MyApp extends StatelessWidget {



  final RecipeRepository recipeRepository;
  final CommentRepository commentRepository;
  final IngredientRepository ingredientRepository;
final StepRepository stepRepository;
  final UserRepository userRepository;
   final AuthenticationRepository authenticationRepository;
  // final UserRecipeRepository userRecipeRepository;
  MyApp(
      {@required this.recipeRepository,
      @required this.commentRepository,
      @required this.ingredientRepository,
      @required this.stepRepository,
      @required this.userRepository,
      @required this.authenticationRepository,
      //@required this.userRecipeRepository
      })
      : assert(recipeRepository != null ||
            commentRepository != null ||
            ingredientRepository != null ||stepRepository!=null ||userRepository!=null|| authenticationRepository!=null );


  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => this.recipeRepository),
        RepositoryProvider(create: (context) => this.commentRepository),
        RepositoryProvider(create: (context) => this.ingredientRepository),
        RepositoryProvider(create: (context) => this.stepRepository),
        RepositoryProvider(create: (context) => this.userRepository),
        RepositoryProvider(create: (context) => this.authenticationRepository),
       //  RepositoryProvider(create: (context) => this.userRecipeRepository),
        
      ],
      //value: this.recipeRepository,
      child: MultiBlocProvider(
        providers: [
            BlocProvider(
              create: (context) => AuthenticationBloc(authenticationRepository: this.authenticationRepository)),

          BlocProvider(
              create: (context) =>
                  RecipeBloc(recipeRepository: this.recipeRepository)
                    ..add(RecipeRetrieve())),
          BlocProvider(
              create: (context) =>
                  CommentBloc(commentRepository: this.commentRepository)),
                   BlocProvider(
              create: (context) =>
                  IngredientBloc(ingredientRepository: this.ingredientRepository)),
                     BlocProvider(
              create: (context) =>
                  StepBloc(stepRepository: this.stepRepository)),

                  
            //  BlocProvider(
            //   create: (context) =>
                  
            //       UserRecipeBloc(userRecipeRepository: this.userRecipeRepository)),
                  
        ],
        // create: (context) => RecipeBloc(recipeRepository: this.recipeRepository)..add(RecipeRetrieve()),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline5: TextStyle(
                    color: Color.fromRGBO(10, 56, 92, 1),
                    // fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                  headline4: TextStyle(
                    color: Color.fromRGBO(10, 56, 92, 1),
                    // fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
            //backgroundColor:Color.fromRGBO(125,125 ,125 , 0.1),
            accentColor: Colors.red[300],
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (_,state){
              if(state is AuthenticationAuthenticated){
                  return TabsNavigation();
              }
              else{
                print(state);
                  return AuthForm();
              }
          }),
          onGenerateRoute: BakingAppRoute.generateRoute,
        ),
      ),
    );
  }
}
