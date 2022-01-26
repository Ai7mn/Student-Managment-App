import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AbsenceColumn extends StatelessWidget {
  AbsenceColumn(this.day, this.isMe, this.userId, {this.key});

  final Key key;
  final String userId;
  final Timestamp day;
  final bool isMe;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if(isMe)
            Container(
              height: 130,
              width: 400,
              child :Directionality(
                textDirection: TextDirection.rtl,
              child:  FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text("تغيب الطالب " + snapshot.data['name']),
                        subtitle: Text( "في تاريخ "+ day.toDate().toString()),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
