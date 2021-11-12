import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Step1'),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                        decoration: InputDecoration(labelText: 'Your name')),
                    TextField(
                        decoration:
                            InputDecoration(labelText: 'Date of birth')),
                    TextField(
                        decoration: InputDecoration(labelText: 'About you')),
                    CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/step2');
                      },
                      str: 'Next',
                      backgroundColor: Colors.grey,
                      borderColor: Colors.transparent,
                      textColor: Colors.white,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
