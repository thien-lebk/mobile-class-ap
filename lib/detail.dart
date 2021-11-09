import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Detail'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('01/01/2021'),
                Text(
                    'nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris'),
                Image.network(
                    'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ'),
                Divider(
                  color: Colors.blueGrey,
                ),
                Text('01/01/2021'),
                Text(
                    'nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris'),
                Image.network(
                    'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ'),
                Divider(
                  color: Colors.blueGrey,
                ),
                Text('01/01/2021'),
                Text(
                    'nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris'),
                Image.network(
                    'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ'),
                Divider(
                  color: Colors.blueGrey,
                ),
              ],
            ),
          )),
    );
  }
}
