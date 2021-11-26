import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phinder/countdownTimer.dart';
import 'package:phinder/main.dart';

class ArmWorkout extends StatefulWidget {
  const ArmWorkout({Key? key}) : super(key: key);

  @override
  _ArmWorkoutState createState() => _ArmWorkoutState();
}

class _ArmWorkoutState extends State<ArmWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[200],
        title: Text('Arm Workout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/fullbody/pushUp.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Push Up', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/arm/tricepsDips.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Triceps Dips', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
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
                        'assets/arm/mountainClimber.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Moutain Climber', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/arm/plank.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Plank', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
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
