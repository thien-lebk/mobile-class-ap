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
                      Navigator.pushNamed(context, '/detailedExercise');
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
                              Text('Lower-Body Burnout',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text('20 minutes',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text('Intermediate',
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
                      padding: const EdgeInsets.only(left: 10.0), 
                      child: Text('All challenges', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Running', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),  
                    ), 
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 700
                            ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Image.asset('assets/burnout.jpg', width: 100, colorBlendMode: BlendMode.darken,),
                                  Column(
                                    children: [
                                      Text('abc', style: TextStyle(color: Colors.white)),
                                      Text('abc',style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.asset('assets/burnout.jpg', width: 100),
                                  Column(
                                    children: [
                                      Text('abc', style: TextStyle(color: Colors.white)),
                                      Text('abc',style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.asset('assets/burnout.jpg', width: 100),
                                  Column(
                                    children: [
                                      Text('abc', style: TextStyle(color: Colors.white)),
                                      Text('abc',style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.asset('assets/burnout.jpg', width: 100),
                                  Column(
                                    children: [
                                      Text('abc', style: TextStyle(color: Colors.white)),
                                      Text('abc',style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.asset('assets/burnout.jpg', width: 100),
                                  Column(
                                    children: [
                                      Text('abc', style: TextStyle(color: Colors.white)),
                                      Text('abc',style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                              Stack(
                                children: <Widget>[
                                  Image.asset('assets/burnout.jpg', width: 100, colorBlendMode: BlendMode.srcOver,),
                                  Column(
                                    children: [
                                      Text('abc', style: TextStyle(color: Colors.white)),
                                      Text('abc',style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ))
                      )
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
