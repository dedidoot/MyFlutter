import 'dart:convert';
import 'package:flutter_app/helper/Log.dart';
import 'package:flutter_app/model/UserModel.dart';

import 'ListUrls.dart';
import 'HeadersClient.dart';

class RestClient {
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
}
