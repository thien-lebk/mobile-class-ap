import 'package:flutter/material.dart';
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
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('Email'),
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
                          Text('Password'),
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
                          Text('Confirm Password'),
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
                              onTap: () {},
                              child: Center(
                                  child: Text(
                                "Sign In",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue),
                              )))
                        ]))))));
  }
}

//!----------------------------------------------
