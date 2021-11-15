import 'package:flutter/material.dart';
import 'package:phinder/detail.dart';
import 'package:phinder/explore.dart';

class Common extends StatefulWidget {
  const Common({Key? key}) : super(key: key);
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<Common> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return PageView(
            children: [
              Explore(),
              Detail(),
            ],
          );
        });
  }
}

//!----------------------------------------------
