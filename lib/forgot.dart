import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

//!----------------------------------------------
class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  String email = '';
  String password = '';
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: AppBar(
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  flexibleSpace: Row(
                    children: [
                      Expanded(
                          child: Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                            Text('', textAlign: TextAlign.center),
                          ]))),
                      Image.asset('assets/screens/join.png',
                          fit: BoxFit.fitHeight),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 252, 240, 227),
                )),
            body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            'EMAIL',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              height: 40.0,
                              child: TextField(
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 2.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0))))),
                          SizedBox(height: 20.0),
                          CustomButton(
                            onTap: () async {
                              print('email: ' + email);
                              print('password: ' + password);
                              int res = await postResetPassword(email: email);
                              Navigator.pop(context);
                            },
                            str: 'Send password',
                            backgroundColor: Colors.grey,
                            borderColor: Colors.transparent,
                            textColor: Colors.white,
                            width: double.infinity,
                          ),
                        ]))))));
  }
}

//!----------------------------------------------
