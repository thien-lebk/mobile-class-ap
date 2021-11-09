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
                  Expanded(child: Center(child: Text('It\'s a match!'))),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/explore');
                    },
                    str: 'Keep swiping',
                    backgroundColor: Colors.grey,
                    borderColor: Colors.transparent,
                    textColor: Colors.white,
                    width: double.infinity,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    str: 'Send a Hi!',
                    backgroundColor: Colors.grey,
                    borderColor: Colors.transparent,
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
