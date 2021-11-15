import 'package:flutter/material.dart';
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
          appBar: AppBar(
            title: Text('Match'),
          ),
          body: Container(
            // child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Image.asset('assets/screens/match.png'))),
                  Expanded(
                      child: Center(
                          child: Column(
                    children: [
                      Text('It\'s a match!', style: TextStyle(fontSize: 30.0)),
                      Text('Now you can send message to each others'),
                    ],
                  ))),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/social');
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
