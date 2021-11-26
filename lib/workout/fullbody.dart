import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phinder/countdownTimer.dart';
import 'package:phinder/main.dart';

class FullBodyWorkout extends StatefulWidget {
  const FullBodyWorkout({Key? key}) : super(key: key);

  @override
  _FullBodyWorkoutState createState() => _FullBodyWorkoutState();
}

class _FullBodyWorkoutState extends State<FullBodyWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[200],
        title: Text('Full Body Workout',
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
                        'assets/fullbody/jumpingJacks.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Jumping Jacks', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
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
                )
              ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/fullbody/curtsyLunges.gif', width: 100, height: 50, fit: BoxFit.cover),
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
                        'assets/fullbody/kneePushUp.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Knee Push Up', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
             Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        'assets/fullbody/crossArmCrunches.gif', width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Cross Arm Crunches', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
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
