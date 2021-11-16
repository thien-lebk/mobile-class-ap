import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/main.dart';

//! Join Us page
//!----------------------------------------------
class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);
  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
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
                              onTap: () {
                                Navigator.pushNamed(context, '/step1');
                              },
                              str: 'Join Us',
                              backgroundColor: Colors.grey,
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
