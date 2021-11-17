import 'dart:io';
import 'package:path/path.dart';

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
      print('Wrong email or password');
      return '-';
    } else
      return responseData['access'];
  } catch (e) {
    print('Network error');
    print(e);
    return '+';
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

Future<User> getUser({required String token}) async {
  try {
    print('Call api getUser');
    String url = API_LINK + 'user';
    var uri = Uri.parse(url);
    print(uri);
    final response = await http
        .get(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    print(response.body);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print('Ger user error');
      return User("-", "-", "-", "-", false, "-", [], []);
    } else {
      final extractedData =
          json.decode(utf8.decode(response.bodyBytes)) as dynamic;
      print(extractedData);
      User obj = User.fromJson(extractedData['data']);
      return obj;
    }
  } catch (e) {
    print('Network error');
    print(e);
    return User("-", "-", "-", "-", false, "-", [], []);
  }
}

//! --------------------------------------------------------------------
Future<int> postResetPassword({required String email}) async {
  print('Call api reset password');
  String url = API_LINK + 'user/send-email-reset-password';
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response =
        await http.post(uri, body: json.encode({"email": email}), headers: {
      "Content-Type": "application/json",
    });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    return response.statusCode;
    // if (response.statusCode != 201) {
    //   print('Wrong email');
    //   return response.statusCode;
    // } else {
    //   print('Recovery email sent');
    //   return response.statusCode;
    // }
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

Future<List<UserInfo>> getUserList({required String token}) async {
  try {
    print('Call api get user list');
    print('Token: $token');
    String url = API_LINK + 'user/list?perPage=100&page=1';
    var uri = Uri.parse(url);
    print(uri);
    final response = await http
        .get(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    // print(response.body);
    // print(response.statusCode);
    if (response.statusCode != 200) {
      print('Unauthorize request');
      return [];
    }
    // print(json.decode(utf8.decode(response.bodyBytes))['data']['data']['data']);
    final extractedData = json.decode(utf8.decode(response.bodyBytes))['data']
        ['data']['data'] as List<dynamic>;
    print(extractedData);
    List<UserInfo> listUser = [];
    for (var index in extractedData) {
      listUser.add(UserInfo.fromJson(index));
    }

    return listUser;
  } catch (e) {
    print(e);
    return [];
  }
}

//! --------------------------------------------------------------------
Future<int> registerUser({
  String email = "default",
  String fullName = "default",
  String aboutYou = "default",
  String password = "default",
  String phoneNumber = "default",
  String dob = "default",
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
    return response.statusCode;
  } catch (e) {
    print('Network error');
    print(e);
    return -1;
  }
}

//! --------------------------------------------------------------------
//! --------------------------------------------------------------------
//! --------------------------------------------------------------------

Future<int> updateUser({
  required String token,
  required String fullName,
  required String aboutYou,
  required String dob,
  String phoneNumber = "default",
  required List<String> hobbies,
}) async {
  print('Call API updateAccount');
  String url = API_LINK + 'user';
  var uri = Uri.parse(url);
  print(uri);
  print(json.encode({
    "fullName": fullName,
    "aboutYou": aboutYou,
    "dob": dob,
    "phoneNumber": phoneNumber,
    "hobbies": hobbies,
  }));
  try {
    final response = await http.put(uri,
        body: json.encode({
          "fullName": fullName,
          "aboutYou": aboutYou,
          "dob": dob,
          "phoneNumber": phoneNumber,
          "hobbies": hobbies,
        }),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          "Content-Type": "application/json",
        });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 200) {
      print('Update fail');
      return response.statusCode;
    } else {
      print('Update OK');
      return response.statusCode;
    }
  } catch (e) {
    print('Network error');
    print(e);
    return -1;
  }
}

Future<String> createPost({
  required String token,
  String title = "1",
  String content = "1",
  List<String> images = const [],
}) async {
  print('Call API createPost');
  String url = API_LINK + 'post';
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.post(uri,
        body:
            json.encode({"title": title, "content": content, "images": images}),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          "Content-Type": "application/json",
        });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 200) {
      print('Create post fail');
      return '-';
    } else {
      print('Create post OK');
      return 'OK';
    }
  } catch (e) {
    print('Network error');
    print(e);
    return '-';
  }
}

Future<String> editPost(
    {required String token,
    int id = 0,
    String title = "1",
    String content = "1",
    List<String> images = const [],
    bool isDeleted = false}) async {
  print('Call API editPost');
  String url = API_LINK + 'post';
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.put(uri,
        body: json.encode({
          "id": id,
          "title": title,
          "content": content,
          "images": images,
          "isDeleted": isDeleted
        }),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          "Content-Type": "application/json",
        });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 200) {
      print('Edit post fail');
      return '-';
    } else {
      print('Edit post OK');
      return 'OK';
    }
  } catch (e) {
    print('Network error');
    print(e);
    return '-';
  }
}

Future<String> getPost({required String token, required String userId}) async {
  print('Call API editPost');
  String url = API_LINK + 'post/' + userId;
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 200) {
      print('Get post fail');
      return '-';
    } else {
      print('Get post OK');
      return 'OK';
    }
  } catch (e) {
    print('Network error');
    print(e);
    return '-';
  }
}

Future<String> deletePost({required String token, String id = "0"}) async {
  print('Call API editPost');
  String url = API_LINK + 'post/' + id;
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 200) {
      print('Delete post fail');
      return '-';
    } else {
      print('Delete post OK');
      return 'OK';
    }
  } catch (e) {
    print('Network error');
    print(e);
    return '-';
  }
}

Future uploadImage({required File toUploadFile, required String token}) async {
  print('Call API upload image');
  String url = API_LINK + 'image';
  var uri = Uri.parse(url);
  print(uri);

  var stream = new http.ByteStream(toUploadFile.openRead());
  stream.cast();
  var length = await toUploadFile.length();
  var request = new http.MultipartRequest("POST", uri);
  request.headers['authorization'] = 'Bearer $token';
  var filename = basename(toUploadFile.path);
  var multipartFile =
      new http.MultipartFile('file', stream, length, filename: filename);
  request.files.add(multipartFile);
  var response = await request.send();
  var finalRes;
  response.stream.transform(utf8.decoder).listen(
    (value) {
      finalRes = value;
      print(value);
    },
    onDone: () {
      print('Upload image satus: ' + jsonDecode(finalRes)['message']);
    },
  );
}

Future<String> deleteImage({required String token, String id = "0"}) async {
  print('Call API editPost');
  String url = API_LINK + 'image/' + id;
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    });

    print('***');
    final responseData = json.decode(response.body);
    print('Status code: ${response.statusCode}');
    print('Data: $responseData');
    if (response.statusCode != 200) {
      print('Delete post fail');
      return '-';
    } else {
      print('Delete post OK');
      return 'OK';
    }
  } catch (e) {
    print('Network error');
    print(e);
    return '-';
  }
}

Future<List<UserHobby>> getHoppy({required String token}) async {
  print('Call API getHoppy');
  String url = API_LINK + 'hobby';
  var uri = Uri.parse(url);
  print(uri);
  try {
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    });

    // print('***');
    // final responseData = json.decode(response.body);
    // print('Status code: ${response.statusCode}');
    // print('Data: $responseData');

    if (response.statusCode != 200) {
      print('Get hoppy fail');
      return [];
    } else {
      print('Get hoppy OK');

      final extractedData =
          json.decode(utf8.decode(response.bodyBytes)) as dynamic;
      List<dynamic> data = extractedData['data'];
      print(data);
      List<UserHobby> lUserHoppy = [];
      for (var index in data) {
        lUserHoppy.add(UserHobby.fromJson(index));
      }

      return lUserHoppy;
    }
  } catch (e) {
    print('Network error');
    print(e);
    return [];
  }
}
