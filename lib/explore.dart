import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Explore'),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
                image: NetworkImage(
                    "https://i1-dulich.vnecdn.net/2021/11/04/laothan11-3308-1636038257.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=ojGL1Ji3E0YKu-WJ-jf7Fw"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quỳnh Anh' + ' , ' + '26',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            ' Yoga ' + ' Swimming ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                onTap: () {
                                  // Navigator.popAndPushNamed(
                                  //     context, '/explore');
                                },
                                str: 'Next',
                                backgroundColor: Colors.grey,
                                borderColor: Colors.transparent,
                                textColor: Colors.white,
                                width: 50,
                              ),
                              CustomButton(
                                onTap: () {
                                  Navigator.pushNamed(context, '/match');
                                },
                                str: 'Match',
                                backgroundColor: Colors.grey,
                                borderColor: Colors.transparent,
                                textColor: Colors.white,
                                width: 50,
                              ),
                              CustomButton(
                                onTap: () {
                                  Navigator.pushNamed(context, '/detail');
                                },
                                str: 'View',
                                backgroundColor: Colors.grey,
                                borderColor: Colors.transparent,
                                textColor: Colors.white,
                                width: 50,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
