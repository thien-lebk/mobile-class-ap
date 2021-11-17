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

//! --------------------------------------------------------------------
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

//! --------------------------------------------------------------------
Future<int> postResetPassword({required String email}) async {
  print('Call api reset password');
  String url =
      API_LINK + 'user/send-email-reset-password/' + Uri.encodeComponent(email);
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.post(
      uri,
      // body: json.encode({"email": email, "password": password}),
      // headers: {
      //   "Content-Type": "application/json",
      // }
    );

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 201) {
      print('Wrong email');
      return response.statusCode;
    } else {
      print('Recovery email sent');
      return response.statusCode;
    }
  } catch (e) {
    print('Network error');
    print(e);
    return -1;
  }
}

//! --------------------------------------------------------------------
class UserInfo {
  UserInfo(
    this.id,
    this.fullName,
    this.aboutYou,
    this.dob,
    this.hobbies,
    this.images,
  );

  String id;
  String fullName;
  String aboutYou;
  String dob;
  List<UserHobby> hobbies;
  List<UserImage> images;

  factory UserInfo.fromJson(dynamic json) {
    List<UserHobby> lUserHoppy = [];
    try {
      for (var index in json['hobbies']) {
        lUserHoppy.add(UserHobby.fromJson(index));
      }
    } catch (e) {}

    List<UserImage> lUserImage = [];
    try {
      for (var index in json['hobbies']) {
        lUserImage.add(UserImage.fromJson(index));
      }
    } catch (e) {}

    return UserInfo(
        json['id'] as String,
        json['fullName'] as String,
        json['aboutYou'] as String,
        json['dob'] as String,
        lUserHoppy,
        lUserImage);
  }
}

class UserHobby {
  UserHobby(
    this.id,
    this.name,
    this.isDeleted,
  );

  String id;
  String name;
  bool isDeleted;

  factory UserHobby.fromJson(dynamic json) {
    return UserHobby(
      json['id'] as String,
      json['name'] as String,
      json['isDeleted'] as bool,
    );
  }
}

class UserImage {
  UserImage(
    this.id,
    this.type,
    this.content,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String type;
  String content;
  bool isDeleted;
  String createdAt;
  String updatedAt;

  factory UserImage.fromJson(dynamic json) {
    return UserImage(
      json['id'] as int,
      json['type'] as String,
      json['content'] as String,
      json['isDeleted'] as bool,
      json['createdAt'] as String,
      json['updatedAt'] as String,
    );
  }
}

Future<String> getUserList({required String token}) async {
  print('Call api get user list');
  print('Token: $token');
  String url = API_LINK + 'user/list?perPage=100&page=1';
  var uri = Uri.parse(url);
  print(uri);
  final response = await http
      .get(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print('***');
  // print(response.body);
  // print(response.statusCode);
  if (response.statusCode != 200) {
    print('Unauthorize request');
    return "-";
  }
  // print(json.decode(utf8.decode(response.bodyBytes))['data']['data']['data']);
  final extractedData = json.decode(utf8.decode(response.bodyBytes))['data']
      ['data']['data'] as List<dynamic>;
  print(extractedData);
  print('Đây là object nhận được từ api, nên return obj để dùng');
  List<UserInfo> listUser = [];
  for (var index in extractedData) {
    listUser.add(UserInfo.fromJson(index));
  }
  print('***+++***');
  print(listUser[0].aboutYou);
  return "*";
}

//! --------------------------------------------------------------------
Future<String> registerAccount({
  String email = "1",
  String fullName = "1",
  String aboutYou = "1",
  String password = "1",
  String phoneNumber = "0",
  String dob = "1",
}) async {
  print('Call API registerAccount');
  String url = API_LINK + 'user';
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.post(uri,
        body: json.encode({
          "email": email,
          "fullName": fullName,
          "aboutYou": aboutYou,
          "password": password,
          "phoneNumber": phoneNumber,
          "dob": dob
        }),
        headers: {
          "Content-Type": "application/json",
        });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 201) {
      print('Register fail');
      return '-';
    } else {
      print('Register OK');
      return 'OK';
    }
  } catch (e) {
    print('Network error');
    print(e);
    return '-';
  }
}
