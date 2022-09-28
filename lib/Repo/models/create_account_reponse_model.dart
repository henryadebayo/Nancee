
import 'dart:convert';

CreateAccountResponse createAccountResponseFromJson(String str) => CreateAccountResponse.fromJson(json.decode(str));

String createAccountResponseToJson(CreateAccountResponse data) => json.encode(data.toJson());

class CreateAccountResponse {
  CreateAccountResponse({
    required this.data,
    required this.password,
  });

  Data data;
  String password;

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) => CreateAccountResponse(
    data: Data.fromJson(json["data"]),
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "password": password,
  };
}

class Data {
  Data({
    required this.status,
    required this.message,
    this.data,
  });

  bool status;
  String message;
  dynamic data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["Status"],
    message: json["Message"],
    data: json["Data"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Data": data,
  };
}
