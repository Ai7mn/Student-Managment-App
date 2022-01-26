import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_app/widgets/absence/absence_column.dart';

class Absence extends StatelessWidget {

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
              .collection('absence')
              .orderBy('day', descending: true)
              .snapshots(),
          builder: (ctx, absenceSnapshot) {
            if (absenceSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
//            else if (absenceSnapshot.data == null) {
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
            final absenceDocs = absenceSnapshot.data.docs;

            return ListView.builder(
              itemCount: absenceDocs.length,
              itemBuilder: (ctx, index) => AbsenceColumn(
                absenceDocs[index]['day'],
                absenceDocs[index]['userId'] == futureSnapshot.data.uid,
                absenceDocs[index]['userId'],
                key: ValueKey(absenceDocs[index].documentID),
              ),
            );
          },
        );
      },
    );
  }
}
