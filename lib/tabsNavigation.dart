import 'package:baking_app/Baking/view/screens/user-screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'Baking/bloc/recipe_bloc/recipe_event.dart';
import 'Baking/view/screens/recipe_screens/pastries_screen.dart';
import 'Baking/view/screens/recipe_screens/user_pastries_screen.dart';

/// This is the stateful widget that the main application instantiates.
class TabsNavigation extends StatefulWidget {
  TabsNavigation({Key key}) : super(key: key);

  @override
  _TabsNavigationState createState() => _TabsNavigationState();
}

/// This is the private State class that goes with TabsNavigation.
class _TabsNavigationState extends State<TabsNavigation> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    UserPastriesScreen(),
    PastriesScreen(),
    UserProfileWrapped(),
  ];

  void _onItemTapped(int index) {
    if(index==1){
       BlocProvider.of<RecipeBloc>(context,listen: false).add(RecipeRetrieve());
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'My Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
