import 'package:flutter/material.dart';

import 'api/RestClient.dart';
import 'helper/Color.dart';
import 'helper/Log.dart';
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
    RestClient.getListUser().then((onValue) {
      for (int i = 0; i < onValue.length; i++) {
        textView.add(
            UserItemView("${onValue[i].firstName} ${onValue[i].lastName}"));
        Log(onValue[i].firstName);
      }
      setState(() {});
    });
    super.initState();
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
