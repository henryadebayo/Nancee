import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/const.dart';
import '../models/user_model.dart';

class AuthServices {
  final UserModel userModel = UserModel();
  late String responseBody;
  late String responseBody2;

  Future<UserModel?>? signUp(String phoneNumber, String password) async {
    final Map<String, dynamic> userData = {
      "phoneNumber": phoneNumber,
      "password": password
    };
    http.Response response = await http.post(
      Uri.parse("$BaseUrl/auth/signup"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(userData),
    );
    print(response.body.toString());

    if (response.statusCode == 200) {
      print("signed up successfully");
      print("This is Sign up response.body ${response.body}");
      var res = jsonDecode(response.body);
      return res;
    } else {
      print(
          "error signing up and response status code is ${response.statusCode}");
      print(json.encode(userData));
      var res = jsonDecode(response.body);
      throw res["message"];
    }
  }

  Future<UserModel?>? signIn(String email, String password) async {
    final Map<String, dynamic> userData = {
      "email": email,
      "password": password,
    };
    http.Response response = await http.post(
      Uri.parse('$BaseUrl/auth/login'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(userData),
    );
    print(response.body);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      final user = UserModel.fromJson(res["data"]["user"]);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', json.encode(user.toJson()));
      print("THIS IS LOG IN USER PREFS ::: ${prefs.toString()}");
      print("THIS IS SIGN IN RESPONSE BODY${response.body}");
      return user;
    } else {
      final res = jsonDecode(response.body);
      print("THIS IS SINNNN ERROR::::::: ${res["message"]}");
      throw res["message"];
    }
  }

  Future<dynamic> getLoggedInUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.get('user');
    if (userJson != null) {
      var jsonUser = json.decode(userJson.toString());
      var user = UserModel.fromJson(jsonUser);
      return user;
    } else {
      return "Please Sign In";
    }
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
