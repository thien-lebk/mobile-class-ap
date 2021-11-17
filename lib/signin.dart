import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:phinder/social.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as StreamClient;

//! Join Us page
//!----------------------------------------------
class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamClient.StreamChatClient client;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                            Text('Welcome to Phinder!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
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
                          Text(
                            'PASSWORD',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              height: 40.0,
                              child: TextField(
                                  onChanged: (val) {
                                    password = val;
                                  },
                                  obscureText: isVisible ? false : true,
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            print('toggle obscure text');
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                          child: Icon(isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
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
                              String token = await signIn(
                                  email: email, password: password);
                              if (token == '-' ||
                                  email.length < 5 ||
                                  password.length < 5) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.WARNING,
                                  animType: AnimType.BOTTOMSLIDE,
                                  headerAnimationLoop: false,
                                  title: "Note",
                                  desc: "Wrong email or password !",
                                  btnCancelColor: Colors.red,
                                  btnCancelOnPress: () {},
                                  btnCancelText: 'Close',
                                ).show();
                              } else if (token == '+') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.WARNING,
                                  animType: AnimType.BOTTOMSLIDE,
                                  headerAnimationLoop: false,
                                  title: "Note",
                                  desc: "Network error !",
                                  btnCancelColor: Colors.red,
                                  btnCancelOnPress: () {},
                                  btnCancelText: 'Close',
                                ).show();
                              } else if (token.length > 1) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('token', token);
                                print('token: $token');
                                User thisUser = await getUser(token: token);
                                print(thisUser.fullName);
                                if (thisUser.isFirstLogin) {
                                  Navigator.pushNamed(context, '/step1');
                                }

                                // print('***Test API***');
                                // SharedPreferences prefs =
                                //     await SharedPreferences.getInstance();
                                // String t = prefs.getString('token') ?? "*";
                                // //! TODO: DELETE AFTER TEST
                                // // await getUser(token: t);
                                // await getUserList(token: t);
                                // Navigator.popAndPushNamed(context, '/social');
                                else {
                                  // List<UserInfo> listUser =
                                  //     await getUserList(token: token);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Social(
                                              token: token,
                                              client: widget.client)));
                                  // Navigator.pushNamed(context, '/social');
                                }
                              } else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.WARNING,
                                  animType: AnimType.BOTTOMSLIDE,
                                  headerAnimationLoop: false,
                                  title: "Note",
                                  desc: "Login error !",
                                  btnCancelColor: Colors.red,
                                  btnCancelOnPress: () {},
                                  btnCancelText: 'Close',
                                ).show();
                              }
                            },
                            str: 'Sign In',
                            backgroundColor: Colors.grey,
                            borderColor: Colors.transparent,
                            textColor: Colors.white,
                            width: double.infinity,
                          ),
                          SizedBox(height: 18.0),
                          GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(context, '/joinUs');
                              },
                              child: Center(
                                  child: Text("Create a new account",
                                      style: GoogleFonts.poppins(
                                          color: Colors.blue,
                                          textStyle:
                                              TextStyle(fontSize: 14))))),
                          SizedBox(height: 18.0),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/forgot');
                              },
                              child: Center(
                                  child: Text("Forgot password ?",
                                      style: GoogleFonts.poppins(
                                          color: Colors.blue,
                                          textStyle:
                                              TextStyle(fontSize: 14))))),
                        ]))))));
  }
}

//!----------------------------------------------
