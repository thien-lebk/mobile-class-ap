import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Step2'),
          ),
          body: Container(
            // child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToggleButtons(
                    borderWidth: 5.0,
                    borderColor: Colors.transparent,
                    selectedBorderColor: Colors.transparent,
                    children: <Widget>[
                      Icon(Icons.directions_run),
                      Icon(Icons.directions_walk),
                      Icon(Icons.self_improvement),
                      Text('Tennis'),
                      Text('Swimming'),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    isSelected: isSelected,
                  ),
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
