import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  flexibleSpace: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Step 2 of 3\nTell us your hobby',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )),
                      Image.asset('assets/screens/hoppy.png',
                          fit: BoxFit.fitHeight),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 248, 207, 97))),
          body: Container(
            // child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(children: [
                            Toggle(txt: 'Running'),
                            SizedBox(width: 30.0),
                            Toggle(txt: 'Walking'),
                            SizedBox(width: 30.0),
                            Toggle(txt: 'Doing push-ups'),
                          ]),
                          Row(children: [
                            Toggle(txt: 'Yoga'),
                            SizedBox(width: 30.0),
                            Toggle(txt: 'Chatting when I\'m free'),
                          ]),
                          Row(children: [
                            Toggle(txt: 'Tennis'),
                            SizedBox(width: 30.0),
                            Toggle(txt: 'Golf'),
                            SizedBox(width: 30.0),
                            Toggle(txt: 'Swimming'),
                          ]),
                          Row(children: [
                            Toggle(txt: 'Going to the gym'),
                            SizedBox(width: 30.0),
                            Toggle(txt: 'Basketball'),
                          ]),
                        ]),
                  ),
                  Expanded(child: Container()),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/step3');
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
            // ),
          )),
    );
  }
}

class Toggle extends StatefulWidget {
  const Toggle({required this.txt});
  final String txt;
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _isSelected ? Colors.blue[100] : Colors.transparent,
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(widget.txt),
        ),
      ),
    );
  }
}
