import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'asking_column.dart';

class Asking extends StatelessWidget {

  Future getUser()async{
    return await FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser() ,
      builder: (cxt, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Askings')
              .orderBy('day', descending: true)
              .snapshots(),
          builder: (ctx, askSnapshot) {
            if (askSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final askDocs = askSnapshot.data.docs;


            return ListView.builder(
              itemCount: askDocs.length,
              itemBuilder: (ctx, index) => AskingColumn(
                askDocs[index]['day'],
                askDocs[index]['userId'] == futureSnapshot.data.uid,
                askDocs[index]['userId'],
                askDocs[index]['results'],
                key: ValueKey(askDocs[index].documentID),
              ),
            );
          },
        );
      },
    );
  }
}
