import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your challenge today',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
            Expanded(
                flex: 6,
                child: InkWell(
                    onTap: () {
                      print('Tap to detailed exercise');
                      Navigator.pushNamed(context, '/abs');
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(38, 38, 38, 70),
                                  BlendMode.srcOver),
                              image: AssetImage('assets/burnout.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ABS WORKOUT',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text('6-10 minutes',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text('Hard',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ))),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 5.0), 
                      child: Text('All challenges', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Text('Workout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),  
                    ), 
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child:
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 420
                            ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  print('Tap to leg workout');
                                  Navigator.pushNamed(context, '/leg');
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset('assets/legWorkout.jpg', width: 90, height: 90, fit: BoxFit.cover),
                                    Column(
                                      children: [
                                        Text('Leg', style: TextStyle(color: Colors.white, fontSize: 14)),
                                        Text('Workout', style: TextStyle(color: Colors.white, fontSize: 14)),
                                        Text('5-10 minutes',style: TextStyle(color: Colors.white, fontSize: 10))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('Tap to full body workout');
                                  Navigator.pushNamed(context, '/fullbody');
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset('assets/fullbodyWorkOut.jpg', width: 90,  height: 90, fit: BoxFit.cover),
                                    Column(
                                      children: [
                                        Text('Full Body', style: TextStyle(color: Colors.white,fontSize: 14)),
                                        Text('Workout', style: TextStyle(color: Colors.white,fontSize: 14)),
                                        Text('5-10 minutes',style: TextStyle(color: Colors.white, fontSize: 10))
                                      ],
                                    )
                                  ],
                                )
                              ),
                              InkWell(
                                onTap: () {
                                  print('Tap to arm workout');
                                  Navigator.pushNamed(context, '/arm');
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset('assets/armWorkout.jpg', width: 90, height: 90, fit: BoxFit.cover),
                                    Column(
                                      children: [
                                        Text('Arm', style: TextStyle(color: Colors.white,fontSize: 14)),
                                        Text('Workout', style: TextStyle(color: Colors.white,fontSize: 14)),
                                        Text('5-10 minutes',style: TextStyle(color: Colors.white))
                                      ],
                                    )
                                  ],
                                )
                              ),
                              InkWell(
                                onTap: () {
                                  print('Tap to butt workout');
                                  Navigator.pushNamed(context, '/butt');
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset('assets/buttWorkout.jpg', width: 90, height: 90, fit: BoxFit.cover),
                                    Column(
                                      children: [
                                        Text('Butt', style: TextStyle(color: Colors.white,fontSize: 14)),
                                        Text('Workout', style: TextStyle(color: Colors.white,fontSize: 14)),
                                        Text('5-10 minutes',style: TextStyle(color: Colors.white))
                                      ],
                                    )
                                  ],
                                )
                              ),
                            ],
                          ))
                      ))
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
