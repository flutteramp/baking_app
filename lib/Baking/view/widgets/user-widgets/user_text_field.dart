
import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final String label;
  final bool obscure;


  const UserTextField(this.label,this.obscure);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            obscureText: obscure,
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              focusColor: Theme.of(context).accentColor,
              border: OutlineInputBorder(),

            ),

          ),
          
        ],
      ),
    );
  }
}
