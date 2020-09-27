import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: RchApp(),
  ));
}

class RchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Presbyterian RCH"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("rch").snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot rch = snapshot.data.docs[index];
                  return ListTile(
                    leading: rch.data()['c0_id'],
                    title: rch.data()['c1title'],
                    subtitle: rch.data()['c4lyrics'],
                  );
                },
              );
            }));
  }
}
