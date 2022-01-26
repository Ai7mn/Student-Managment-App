import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskingColumn extends StatelessWidget {

  AskingColumn(this.day, this.isMe, this.userId, this.results,{this.key});

  final Key key;
  final String userId;
  final String results;
  final Timestamp day;
  final bool isMe;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if(isMe)
          Container(
            height: 160,
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
                        title: Text(  "تمت مسائلة الطالب " + snapshot.data['name'] +"\n" + results),
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

