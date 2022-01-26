import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_app/screens/home_screen.dart';
import 'package:school_app/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STS',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        backgroundColor: Colors.white70,
        accentColor: Colors.amber,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.blue[900],
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle( fontSize: 15 ,color: Colors.blue[900]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.blue[900],
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.blue[900],
              width: 3,
            ),
          ),
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (ctx , snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}

