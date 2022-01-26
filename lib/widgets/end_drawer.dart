import 'package:flutter/material.dart';
import 'package:school_app/screens/absence_screen.dart';
import 'package:school_app/screens/askings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_app/widgets/choice.dart';

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          //header
          new UserAccountsDrawerHeader(
            accountName: Text('Aiman Ahmed'),
            accountEmail: Text("1324243"),
            decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          //body
          InkWell(
            onTap: () {},
            child: Choice(Icons.receipt, "النتائج", Colors.amber),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AbsenceScreen()));
            },
            child: Choice(Icons.airline_seat_flat, "الغياب", Colors.amber),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AskingsScreen()));
            },
            child: Choice(
                Icons.question_answer, "المسآئلة المفاجأة", Colors.amber),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: Choice(Icons.report_problem, "الشكاوي", Colors.red),
          ),
          Divider(),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Choice(Icons.exit_to_app, "تسجيل الخروج", Colors.red),
          ),
        ],
      ),
    );
  }
}
