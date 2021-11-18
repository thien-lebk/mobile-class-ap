import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

//! Join Us page
//!----------------------------------------------
class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);
  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  String email = '';
  String password = '';
  String confirm_password = '';
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
                            Text('',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ]))),
                      Image.asset('assets/screens/join.png',
                          fit: BoxFit.fitWidth),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 252, 240, 227),
                )),
            body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(72))),
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
                            Text(
                              'CONFIRM PASSWORD',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                                height: 40.0,
                                child: TextField(
                                    onChanged: (val) {
                                      confirm_password = val;
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
                                print('Email: $email');
                                print('Password: $password');
                                print('Confirm password: $confirm_password');
                                if (email.length < 5) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.WARNING,
                                    animType: AnimType.BOTTOMSLIDE,
                                    headerAnimationLoop: false,
                                    title: "Note",
                                    desc: "Wrong email !",
                                    btnCancelColor: Colors.red,
                                    btnCancelOnPress: () {},
                                    btnCancelText: 'Close',
                                  ).show();
                                } else if (password != confirm_password) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.WARNING,
                                    animType: AnimType.BOTTOMSLIDE,
                                    headerAnimationLoop: false,
                                    title: "Note",
                                    desc: "Password not match !",
                                    btnCancelColor: Colors.red,
                                    btnCancelOnPress: () {},
                                    btnCancelText: 'Close',
                                  ).show();
                                } else if (password.length < 5) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.WARNING,
                                    animType: AnimType.BOTTOMSLIDE,
                                    headerAnimationLoop: false,
                                    title: "Note",
                                    desc:
                                        "Password need at least 5 or more characters!",
                                    btnCancelColor: Colors.red,
                                    btnCancelOnPress: () {},
                                    btnCancelText: 'Close',
                                  ).show();
                                } else {
                                  int resCode = await registerUser(
                                    email: email,
                                    password: password,
                                    dob: DateTime.now().toIso8601String(),
                                  );
                                  if (resCode < 0) {
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
                                  } else if (resCode == 201) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.WARNING,
                                      animType: AnimType.BOTTOMSLIDE,
                                      headerAnimationLoop: false,
                                      title: "Succeed",
                                      desc:
                                          "Now you can Log In with this account!",
                                      btnOkColor: Colors.green,
                                      btnOkOnPress: () {
                                        Navigator.popAndPushNamed(
                                            context, '/signIn');
                                      },
                                      btnOkText: 'Close',
                                    ).show();
                                  } else if (resCode == 409) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.WARNING,
                                      animType: AnimType.BOTTOMSLIDE,
                                      headerAnimationLoop: false,
                                      title: "Note",
                                      desc: "This email already existed !",
                                      btnCancelColor: Colors.red,
                                      btnCancelOnPress: () {},
                                      btnCancelText: 'Close',
                                    ).show();
                                  } else
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.WARNING,
                                      animType: AnimType.BOTTOMSLIDE,
                                      headerAnimationLoop: false,
                                      title: "Note",
                                      desc: "Server error!",
                                      btnCancelColor: Colors.red,
                                      btnCancelOnPress: () {},
                                      btnCancelText: 'Close',
                                    ).show();
                                }
                              },
                              str: 'Join Us',
                              backgroundColor: Colors.black87,
                              borderColor: Colors.transparent,
                              textColor: Colors.white,
                              width: double.infinity,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.popAndPushNamed(context, '/signIn');
                                },
                                child: Center(
                                    child: Text("Sign In",
                                        style: GoogleFonts.poppins(
                                            color: Colors.blue,
                                            textStyle:
                                                TextStyle(fontSize: 14)))))
                          ]))),
                ))));
  }
}

//!----------------------------------------------
