import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phinder/countdownTimer.dart';
import 'package:phinder/main.dart';

class AbsWorkout extends StatefulWidget {
  const AbsWorkout({Key? key}) : super(key: key);

  @override
  _AbsWorkoutState createState() => _AbsWorkoutState();
}

class _AbsWorkoutState extends State<AbsWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[200],
        title: Text('ABS Workout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //     flex: 1,
            //     child: Padding(
            //         padding: const EdgeInsets.only(left: 28.0, top: 20.0),
            //         child: Text('ABS Workout',
            //             style: TextStyle(
            //                 fontSize: 16, fontWeight: FontWeight.bold)))),
            Expanded(child: Container()),
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/abs/birdDog.gif',
                          width: 100, height: 50, fit: BoxFit.cover),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('Bird Dog',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                    ],
                  ),
                )),
            SizedBox(height: 32.0),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/abs/bridge.gif',
                        width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Bridge',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)))
                  ],
                )),
            SizedBox(height: 32.0),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/abs/reverseCrunches.gif',
                        width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Reverse Crunches',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)))
                  ],
                )),
            SizedBox(height: 32.0),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/abs/sidePlank.gif',
                        width: 100, height: 50, fit: BoxFit.cover),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Side Plank',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)))
                  ],
                )),
            Expanded(
                flex: 5,
                child:
                    Container(alignment: Alignment.center, child: TimerApp())),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
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
                        width: 300)))
          ],
        ),
      ),
    ));
  }
}
