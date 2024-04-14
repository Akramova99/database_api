import 'dart:convert';

import 'package:database_api/model/users.dart';
import 'package:http/http.dart';

class NetService {
  static String BASE = 'jsonplaceholder.typicode.com';

  /// api uri
  static String GET_API = '/posts';
  static String POST_API = '/posts';
  static String PUT_API = '/posts/'; //+ id
  static String DELETE_API = '/posts/'; //+ id
  /// HEADERS
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  static Future<String?> GET_METHOD(
      String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST_METHOD(
      String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await post(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT_METHOD(
      String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await put(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE_METHOD(
      String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, dynamic> get_params() => {};

  static Map<String, dynamic> delete_params() => {};

  static Map<String, dynamic> post_params(Users users) =>
      {"title": users.title, "body": users.body, "userid": users.userId};

  static Map<String, dynamic> put_params(Users users) => {
        "title": users.title,
        "body": users.body,
        "userid": users.userId,
        "id": users.id
      };

  ///return object list for users
  static List<Users> parsingResponse(String response){
    var myJson = jsonDecode(response);
    //map edi listga modeldagi from jsonni ishlatdim
    List<Users> user=  List.from(myJson.map((mp)=>Users.fromJson(mp)));
    return user;
  }
}
///