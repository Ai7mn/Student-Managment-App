import 'package:flutter/material.dart';
import 'package:school_app/widgets/assignment.dart';
import 'package:school_app/widgets/end_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          "مدارس العلوم والتقنية",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.menu,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
        ],
      ),
        endDrawer: EndDrawer(),
      body: Container(
        width: 410,
          child: Assignment()),
    );
  }
}
