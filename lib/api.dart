import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

const API_LINK = 'https://mobile-app-123.herokuapp.com/';

Future<String> signIn({required String email, required String password}) async {
  print('call api');
  String url = API_LINK + 'login';
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.post(uri,
        body: json.encode({"email": email, "password": password}),
        headers: {
          "Content-Type": "application/json",
        });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 201) {
      print('Loi user nhap sai');
      return '-';
    } else
      return responseData['access'];
  } catch (e) {
    print('Loi network');
    print(e);
    return '-';
  }
}

class User {
  String id;
  String fullName;
  String aboutYou;
  String phoneNumber;
  bool isFirstLogin;
  String dob;
  List<dynamic> hobbies;
  List<dynamic> images;

  User(
    this.id,
    this.fullName,
    this.aboutYou,
    this.phoneNumber,
    this.isFirstLogin,
    this.dob,
    this.hobbies,
    this.images,
  );

  factory User.fromJson(dynamic json) {
    print('json');
    print(json);
    return User(
        json['id'] as String,
        json['fullName'] as String,
        json['aboutYou'] as String,
        json['phoneNumber'] as String,
        json['isFirstLogin'] as bool,
        json['dob'] as String,
        json['hobbies'] as List<dynamic>,
        json['images'] as List<dynamic>);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'fullName': this.fullName,
      'aboutYou': this.aboutYou,
      'phoneNumber': this.phoneNumber,
      'isFirstLogin': this.isFirstLogin,
      'dob': this.dob,
      'hobbies': this.hobbies,
      'images': this.images,
    };
  }
}

Future<String> getUser({required String token}) async {
  //GET
  print('Token: $token');
  String url = API_LINK + 'user';
  var uri = Uri.parse(url);
  print(uri);
  final response = await http
      .get(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

  print(response.body);
  print(response.statusCode);
  if (response.statusCode != 200) {
    print(0);
    return "-";
  }
  print(1);
  final extractedData = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
  print(extractedData);
  User obj = User.fromJson(extractedData['data']);
  print('Đây là object nhận được từ api, nên return obj để dùng');
  print(obj);
  return "*";
}
