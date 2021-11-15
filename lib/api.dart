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
