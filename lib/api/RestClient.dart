import 'dart:convert';
import 'package:flutter_app/helper/Log.dart';
import 'package:flutter_app/model/UserModel.dart';

import 'ListUrls.dart';
import 'HeadersClient.dart';

class RestClient {
  static HeadersClient setHeader() {
    return HeadersClient();
  }

  static Future<UserModel> getSingleUser(String id) async {
    var result = await HeadersClient()
        .get(ListUrls.BASE_API + ListUrls.singleUserUrl.replaceAll("{id}", id));

    Log("reponse ${result.body}");
    Log("url ${result.request}");
    Log("header ${result.request.headers}");

    var jsonObject = jsonDecode(result.body);
    var userData = (jsonObject as Map<String, dynamic>)["data"];
    return UserModel.createUser(userData);
  }

  static Future<List<UserModel>> getListUser() async {
    var result =
        await HeadersClient().get(ListUrls.BASE_API + ListUrls.listUserUrl);

    Log("reponse ${result.body}");
    Log("url ${result.request}");
    Log("header ${result.request.headers}");

    var jsonObject = jsonDecode(result.body);
    List<dynamic> datas = jsonObject["data"];

    List<UserModel> users = [];
    for (var i = 0; i < datas.length; i++) {
      users.add(UserModel(id: datas[i]["id"].toString(), firstName: datas[i]["first_name"], lastName: datas[i]["last_name"]));
    }
    return users;
  }
}
