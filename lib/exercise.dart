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
                              image: NetworkImage(
                                  'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg'),
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
                    Text('All challenges',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Running',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg',
                                      width: 112),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Running',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('20 minutes',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text('Intermediate',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg',
                                      width: 112),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Running',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('20 minutes',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text('Intermediate',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg',
                                      width: 112),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Running',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('20 minutes',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text('Intermediate',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg',
                                      width: 112),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Running',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('20 minutes',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text('Intermediate',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg',
                                      width: 112),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Running',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('20 minutes',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text('Intermediate',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      'https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg',
                                      width: 112),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Running',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('20 minutes',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      Text('Intermediate',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),

                          ],
                        ))
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
