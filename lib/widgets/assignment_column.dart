import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignmentColumn extends StatelessWidget {

  AssignmentColumn(this.grade , this.day , this.sub1 , this.sub1HW , this.isMyGrade ,{this.key});

  final Key key;
  final String grade;
  final String sub1;
  final String sub1HW;
  final Timestamp day;
  final bool isMyGrade;

   getGrade() async {
     final QuerySnapshot result = await FirebaseFirestore.instance
         .collection("grades")
         .where("id", isEqualTo: '12')
         .get();
     final List<DocumentSnapshot> documents = await result.docs;
      return documents[0]['title'];

 }



  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        if(isMyGrade)
          Container(
            height: 260,
            width: 400,
            child :Directionality(
              textDirection: TextDirection.rtl,
              child:  FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('subject').doc(sub1).get(),
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
                        title: Text(" "),
                        subtitle: Text( "في تاريخ "+ day.toDate().toString()),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(snapshot.data['subjectName']),
                        subtitle: Text(sub1HW),
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

