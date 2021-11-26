import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/main.dart';
import 'package:phinder/step1.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                            Text('Edit your profile',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ],
                        ),
                      )),
                      Image.asset('assets/screens/capture.png',
                          fit: BoxFit.fitHeight),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 248, 207, 97))),
          body: Column(children: [
            // child: SingleChildScrollView(
            _itemUI(
              icon_1: Icons.person_outline,
              txt: "Edit profile",
              icon_2: Icons.navigate_next,
              onTap: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Step1()));
              },
            ),
            _itemUI(
              icon_1: Icons.policy,
              txt: "About us",
              icon_2: Icons.navigate_next,
              onTap: () {
                Navigator.of(context).pushNamed('/aboutUs');
              },
            ),

            _itemUI(
              icon_1: Icons.logout,
              txt: "Log out",
              icon_2: Icons.navigate_next,
              onTap: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
          ]
              // ),
              )),
    );
  }

  Widget _itemUI(
      {required icon_1,
      required txt,
      required icon_2,
      VoidCallback? onTap,
      String phone = ''}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex: 1, child: Icon(icon_1, size: 28)),
              Expanded(
                flex: phone != '' ? 2 : 4,
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              phone != ''
                  ? Expanded(
                      flex: 3,
                      child: Text(
                        phone,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    )
                  : Expanded(child: Icon(icon_2, size: 28))
            ],
          ),
        ),
      ),
    );
  }
}
