import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phinder/countdownTimer.dart';
import 'package:phinder/main.dart';

class LegWorkout extends StatefulWidget {
  const LegWorkout({Key? key}) : super(key: key);

  @override
  _LegWorkoutState createState() => _LegWorkoutState();
}

class _LegWorkoutState extends State<LegWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 20.0),
                    child: Text('Leg Workout',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/leg/curtsyLunges.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Curtsy Lunges', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
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
                )
              ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/leg/sideLying.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Side-Lying Leg Lift', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
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
