import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/pastries_details_tabs.dart';
import 'package:flutter/material.dart';

class PastryDetailScreen extends StatelessWidget {
  final Recipe recipe;

  static String routeName = 'detailsScreen';

  const PastryDetailScreen({this.recipe});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Baker'),
        //   backgroundColor: Color.fromRGBO(10, 10, 10, 1),
        // ),
        body: Column(
          children: <Widget>[
            Container(
              child: Stack(alignment: Alignment.topLeft, children: <Widget>[
                Container(
                  child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                  
                      child: Image.asset(
                        'cake.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),),),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: InkWell(
                      child: IconButton(
                        onPressed:() {Navigator.of(context).pop();},
                        icon: Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: Colors.white,
                
                        ),
                
                      ),
                    )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 29,
                vertical: 10,
              ),
              child: Text(
                "${recipe.title}",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            PastriesDetailsTabs(recipe),

            // PastriesDetailsTabs(),
          ],
        ),
      ),
    );
  }
}

