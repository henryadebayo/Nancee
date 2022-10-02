import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/const.dart';
import '../models/account_and_user_account_model.dart';
import '../models/users_model.dart';

class AuthServices {
  final UserModel userModel = UserModel();

  Future<UserModel?> signUp(String phoneNumber, String password) async {
    final Map<String, dynamic> userData = {
      "phoneNumber": phoneNumber,
      "password": password
    };
    http.Response response = await http.post(
      Uri.parse("$BaseUrl/auth/signup"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(userData),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("signed up successfully");
      print("This is Sign up response.body ${response.body}");
      var res = userModelFromJson(response.body);
      return res;
    }
  }

  Future<UserModel?> signIn(String phoneNumber, String password) async {
    final Map<String, dynamic> userData = {
      "phoneNumber": phoneNumber,
      "password": password
    };
    http.Response response = await http.post(
      Uri.parse('$BaseUrl/auth/login'),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(userData),
    );
    print(response.body);

    if (response.statusCode == 200) {
      var res = userModelFromJson(response.body);
      final user = res.data;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', json.encode(user!.toJson()));
      return res;
    }
  }

  Future<dynamic> getLoggedInUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.get('user');
    if (userJson != null) {
      var jsonUser = json.decode(userJson.toString());
      var user = AccountAndUserAccountModel.fromJson(jsonUser);
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
