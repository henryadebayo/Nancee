// To parse this JSON data, do
//
//     final createAccount = createAccountFromJson(jsonString);

import 'dart:convert';

CreateAccount createAccountFromJson(String str) => CreateAccount.fromJson(json.decode(str));

String createAccountToJson(CreateAccount data) => json.encode(data.toJson());

class CreateAccount {
  CreateAccount({
    required this.serviceType,
    required this.requestRef,
    required this.data,
  });

  String serviceType;
  String requestRef;
  CreateAccountData data;

  factory CreateAccount.fromJson(Map<String, dynamic> json) => CreateAccount(
    serviceType: json["serviceType"],
    requestRef: json["requestRef"],
    data: CreateAccountData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "serviceType": serviceType,
    "requestRef": requestRef,
    "data": data.toJson(),
  };
}

class CreateAccountData {
  CreateAccountData({
     this.email,
     this.phoneNumber,
     this.lastName,
     this.firstName,
     this.trackingReference,
  });

  String? email;
  String? phoneNumber;
  String? lastName;
  String? firstName;
  String? trackingReference;

  factory CreateAccountData.fromJson(Map<String, dynamic> json) => CreateAccountData(
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    lastName: json["lastName"],
    firstName: json["firstName"],
    trackingReference: json["trackingReference"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phoneNumber": phoneNumber,
    "lastName": lastName,
    "firstName": firstName,
    "trackingReference": trackingReference,
  };
}
