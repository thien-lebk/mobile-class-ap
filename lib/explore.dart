import 'package:flutter/material.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';

class Explore extends StatefulWidget {
  final UserInfo userInfo;
  const Explore({required this.userInfo, Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    print(widget.userInfo.images);
    print(widget.userInfo.fullName);

    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
            image: NetworkImage(widget.userInfo.images.length == 0
                ? "https://i1-dulich.vnecdn.net/2021/11/04/laothan11-3308-1636038257.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=ojGL1Ji3E0YKu-WJ-jf7Fw"
                : widget.userInfo.images[0].url),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: MediaQuery.of(context).size.width * 3 / 4),
            Expanded(
              // height: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userInfo.fullName +
                          ', ' +
                          (2021 -
                                  int.parse(
                                      widget.userInfo.dob.substring(0, 4)))
                              .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      widget.userInfo.aboutYou,
                      style:
                          TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      widget.userInfo.hobbies.length == 0
                          ? "Don't have any hoppy"
                          : widget.userInfo.hobbies[0].name,
                      style:
                          TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onTap: () {
                            // Navigator.pushNamed(context, '/match');
                          },
                          str: 'X',
                          backgroundColor: Colors.transparent,
                          borderColor: Color.fromARGB(255, 240, 108, 123),
                          textColor: Color.fromARGB(255, 223, 195, 198),
                          width: 50,
                        ),
                        CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/match');
                          },
                          str: '✔',
                          backgroundColor: Color.fromARGB(255, 184, 245, 235),
                          borderColor: Colors.transparent,
                          textColor: Color.fromARGB(255, 22, 151, 130),
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
      )),
    );
  }
}
