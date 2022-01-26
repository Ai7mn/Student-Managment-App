import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_app/widgets/assignment_column.dart';

class Assignment extends StatelessWidget {
  Future getUser() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (cxt, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (futureSnapshot == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('assignments')
              .orderBy('day', descending: true)
              .snapshots(),
          builder: (ctx, assignmentSnapshot) {
            if (assignmentSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (assignmentSnapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final assignmentDocs = assignmentSnapshot.data.docs;

            return ListView.builder(
              itemCount: assignmentDocs.length,
              itemBuilder: (ctx, index) => AssignmentColumn(
                assignmentDocs[index]['grade'],
                assignmentDocs[index]['day'],
                assignmentDocs[index]['class1']['id'].toString(),
                assignmentDocs[index]['class1']['assign'].toString(),
                assignmentDocs[index]['grade'] == futureSnapshot.data['grade'],
                key: ValueKey(assignmentDocs[index].documentID),
              ),
            );
          },
        );
      },
    );
  }
}
