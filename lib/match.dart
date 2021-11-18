import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/main.dart';

class Match extends StatefulWidget {
  const Match({Key? key}) : super(key: key);

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child:
                      Center(child: Image.asset('assets/screens/match.png'))),
              Expanded(
                  child: Center(
                      child: Column(
                children: [
                  Text('It\'s a match!',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500))),
                  Text('Now you can send message to each others',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))),
                ],
              ))),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                str: 'Keep swiping',
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
                width: double.infinity,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, '/chat');
                },
                str: 'Send a Hi!',
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                textColor: Colors.white,
                width: double.infinity,
              ),
            ],
          ),
        ),
        // ),
      )),
    );
  }
}
