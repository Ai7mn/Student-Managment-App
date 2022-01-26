import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_app/widgets/daily_asking/asking.dart';

class AskingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          "سجل المسائلة",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20.0,
          ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back , color: Theme.of(context).accentColor,), onPressed: ()=> Navigator.pop(context)),
      ),
      body: Container(
        width: 410,
        child: Asking(),
      ),
    );
  }
}

