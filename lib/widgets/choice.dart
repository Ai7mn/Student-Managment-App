import 'package:flutter/material.dart';

class Choice extends StatelessWidget {

  Choice(this.icon , this.text , this.color);

  final IconData icon;
  final String text;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return  Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          leading: Icon(icon  , color: color),
          title: Text(text),
        ),
    );
  }
}
