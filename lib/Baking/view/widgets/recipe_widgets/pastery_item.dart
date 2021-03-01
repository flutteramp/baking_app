import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/pastry_detail_screen.dart';
import 'package:flutter/material.dart';



class PasteryItem extends StatelessWidget {
final Recipe recipe;

  const PasteryItem(this.recipe) ;
  Widget iconBuilder(String text, IconData data, BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Icon(
            data,
            color: Theme.of(context).accentColor,
          ),
        ),
        Text(text, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 20, left: 10),
      child: Ink(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(PastryDetailScreen.routeName, arguments: recipe);
          },
          child: Row(children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                      width: 130,
                      child: Image.asset(
                        'cake.jpg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      '${recipe.title}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  iconBuilder('${recipe.duration} mins', Icons.schedule, context),
                  iconBuilder('${recipe.servings} servings', Icons.people, context),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
