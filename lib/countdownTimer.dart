import 'package:flutter/material.dart';
import 'dart:async';
import 'package:phinder/main.dart';

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer? timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    //int hours = secondsPassed ~/ (60 * 60);

    return Container(
      alignment: Alignment.center,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                str: '▶',
                backgroundColor: Colors.transparent,
                borderColor: Color.fromRGBO(159, 158, 156, 40),
                textColor: Color.fromRGBO(159, 158, 156, 40),
                width: 50),
            Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 40)),
          ]),
    );
  }
}