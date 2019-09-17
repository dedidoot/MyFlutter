import 'package:flutter/material.dart';

import 'api/RestClient.dart';
import 'helper/Color.dart';
import 'view/UserItemView.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> textView = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 1000; i++) {
      textView.add(UserItemView("Data ke $i"));
    }

    RestClient.getSingleUser("2").then((onValue) {
      print("user id: " + onValue.id);
      print("first name: " + onValue.firstName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("woow"),
          backgroundColor: hexToColor("#82a2ff"),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: textView,
            ),
          ],
        ),
      ),
    );
  }
}
