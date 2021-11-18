import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      Text('Today, your challenge is',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500))),
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
                              Text('Abs Workout Excercise',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500))),
                              Text('\u{1F551} 6-10min',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500))),
                              Text('\u{2B50} Hard',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500))),
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
                        child: Text('All challenges',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)))),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 420),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print('Tap to leg workout');
                                        Navigator.pushNamed(context, '/leg');
                                      },
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset('assets/legWorkout.jpg',
                                              width: 140,
                                              height: 140,
                                              fit: BoxFit.cover),
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Column(
                                              children: [
                                                Text('Leg \nWorkout',
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))),
                                                Text('10 minutes',
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          print('Tap to full body workout');
                                          Navigator.pushNamed(
                                              context, '/fullbody');
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                                'assets/fullbodyWorkOut.jpg',
                                                width: 140,
                                                height: 140,
                                                fit: BoxFit.cover),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Column(
                                                children: [
                                                  Text('Full Body \nWorkout',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                  Text('15 minutes',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)))
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    InkWell(
                                        onTap: () {
                                          print('Tap to arm workout');
                                          Navigator.pushNamed(context, '/arm');
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset('assets/armWorkout.jpg',
                                                width: 140,
                                                height: 140,
                                                fit: BoxFit.cover),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Column(
                                                children: [
                                                  Text('Arm \nWorkout',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                  Text('10 minutes',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)))
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    InkWell(
                                        onTap: () {
                                          print('Tap to butt workout');
                                          Navigator.pushNamed(context, '/butt');
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                                'assets/buttWorkout.jpg',
                                                width: 140,
                                                height: 140,
                                                fit: BoxFit.cover),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Column(
                                                children: [
                                                  Text('Buttock \nWorkout',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                  Text('20 minutes',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)))
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ))))
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
