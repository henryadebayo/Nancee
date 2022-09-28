import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/create_account_model.dart';

class CreateAccountServices {
  final CreateAccountData createAccountData = CreateAccountData();

  Future<dynamic> createAccount(
      String email, phoneNumber, lastName, firstName) async {
    try {
      final Map<String, dynamic> createAccountData = {
        "serviceType": "ADMIN_CREATE_VIRTUAL_ACCOUNT",
        "email": email,
        "phoneNumber": phoneNumber,
        "lastName": lastName,
        "firstName": firstName,
        "trackingReference": "nance+$phoneNumber"
      };
      http.Response response = await http.post(Uri.parse("kudaBaseUrl"),
          body: json.encode(createAccountData));
    } catch (e) {
      print("THIS IS CREATE ACCONNT ERROR ::: ${e.toString()}");
    }
  }
}
