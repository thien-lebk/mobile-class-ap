import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("About us")),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We are young students that love computer programming as well as mobile development !\n\n',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  '1912594 - Nguyễn Quang Anh',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '1927027 - Nguyễn Hữu Nghĩa',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '1813340 - Nguyễn Vũ Thành Nhân',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '1920058 - Lê Tất Thiện',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ));
  }
}
