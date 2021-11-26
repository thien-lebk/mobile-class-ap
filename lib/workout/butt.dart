import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phinder/countdownTimer.dart';
import 'package:phinder/main.dart';

class ButtWorkout extends StatefulWidget {
  const ButtWorkout({Key? key}) : super(key: key);

  @override
  _ButtWorkoutState createState() => _ButtWorkoutState();
}

class _ButtWorkoutState extends State<ButtWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[200],
        title: Text('Buttock Workout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child:Container()),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/leg/squats.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Squats', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/leg/wallSit.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Wall Sit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )
              ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/buttock/buttBrigde.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Butt Bridge', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/buttock/donkeyKicks.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Donkey Kicks', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: TimerApp()
              )
            ),
            Expanded(
              flex: 1,
              child: Container(alignment: Alignment.center,
              child: CustomButton(
                  onTap: () {
                    print('Completed!');
                    // Navigator
                    Navigator.pushNamed(context, '/post');
                  },
                  str: 'COMPLETE',
                  backgroundColor: Color.fromRGBO(248, 207, 97, 30),
                  borderColor: Colors.transparent,
                  textColor: Colors.black,
                  width: 300))
            )
          ],
        ),
      ),
    ));
  }
}
