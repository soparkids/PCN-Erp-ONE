import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'hymndetail.dart';
import 'hymnsearch.dart';
//import 'package:firebase_core/firebase_core.dart' show Firebase;

class RchApp extends StatefulWidget {
  @override
  _RchAppState createState() => _RchAppState();
}

class _RchAppState extends State<RchApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Presbyterian RCH "),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: HymnSearchDelegate(messages: Query));
              },
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/pcnlogo1.jpg"),
                      fit: BoxFit.cover)),
              child: Container(),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              title: Text("Moderator of General Assembly"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                // _displayFavoritesPage(context);
              },
            ),
            ListTile(
                title: Text("PC of General Assembly"),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }),
                 ListTile(
                title: Text("Hymnal"),
                leading: Icon(Icons.menu_book),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }),
             ListTile(
                title: Text("Bible"),
                leading: Icon(Icons.auto_stories_rounded),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }),
                 ListTile(
                title: Text("Practice & Procedure"),
                leading: Icon(Icons.bookmark_add),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }), 
                 ListTile(
                title: Text("The Blue Book"),
                leading: Icon(Icons.bookmark_add),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }),  ListTile(
                title: Text("Approved Dates 2021"),
                leading: Icon(Icons.calendar_today),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }),  ListTile(
                title: Text("Bible"),
                leading: Icon(Icons.auto_stories_rounded),
                onTap: () {
                  Navigator.pop(context);
                  // _displayLanguagesPage(context);
                }),     
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                //_displaySettingsPage(context);
              },
            ),
          ],
        )),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("rch").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              var messages = snapshot.data.docs;
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 9.0),
                itemCount: messages.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  DocumentSnapshot rch = messages[index];
                  return Card(
                    elevation: 5.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(rch.data()['c0_id']),
                      ),
                      title: Text(rch.data()['c1title']),
                      isThreeLine: true,
                      subtitle: Text(
                        rch.data()['c4lyrics'],
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HymnDetail(
                                rch.data()['c0_id'], rch.data()['c4lyrics']),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }));
  }
}
