import 'package:flutter/material.dart';
import 'package:flutter_app/helper/Color.dart';

class UserItemView extends Widget {
  String datane = "";

  UserItemView(String data) {
    datane = data;
  }

  @override
  Element createElement() {
    return Card(
      elevation: 0,
      color: hexToColor("#82a2ff"),
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              "Username $datane",
              style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "xw wxwx $datane",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    ).createElement();
  }
}
