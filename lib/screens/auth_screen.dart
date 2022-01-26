import 'package:flutter/cupertino.dart';
import 'package:school_app/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
      String email,
      String password,
      String username,
      String name,
      String shopName,
      String phone,
      String address,
      bool agree,
      bool isLogin,
      ) async {
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user.uid)
            .set({
          'username': username,
          'email': email,
          'name': name,
          'shopName':shopName,
          'phone':phone,
          'address':address,
          'agree':agree,
        });
      }


    } on PlatformException catch (err) {
      var massage = " Error please check your credentials !";

      if (err != null) {
        massage = err.message;
      }
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text(massage),
            backgroundColor: Theme.of(context).errorColor),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: AuthForm(
            _submitAuthForm,
            _isLoading,
          ),
        ));
  }
}
