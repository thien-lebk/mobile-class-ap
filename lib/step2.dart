import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:phinder/step3.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> chosenHoppy = [];

class Step2 extends StatefulWidget {
  final String fullName;
  final String aboutYou;
  final String dob;
  final List<UserHobby> listHoppy;
  final String token;

  const Step2(
      {required this.fullName,
      required this.aboutYou,
      required this.dob,
      required this.listHoppy,
      required this.token,
      Key? key})
      : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  bool isFirstload = true;
  @override
  Widget build(BuildContext context) {
    if (isFirstload) {
      print('Clear hoppy list');
      chosenHoppy = [];
      isFirstload = false;
    }
    List<Widget> lWidget = [];
    for (var i = 0; i < widget.listHoppy.length; i = i + 3) {
      // print(widget.listHoppy[i].id);
      // print(widget.listHoppy[i].name);
      // print(i % 2);
      if (i % 3 == 0) {
        lWidget.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Toggle(txt: widget.listHoppy[i].name),
            (i + 1) < widget.listHoppy.length
                ? Toggle(txt: widget.listHoppy[i + 1].name)
                : Container(),
            (i + 2) < widget.listHoppy.length
                ? Toggle(txt: widget.listHoppy[i + 2].name)
                : Container(),
          ],
        ));
      }
      //   SizedBox(width: 10.0),
    }

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  flexibleSpace: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Step 2 of 3\nTell us your hobby                            ',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
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
                        children: lWidget),
                  ),
                  Expanded(child: Container()),
                  CustomButton(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Step3(
                                    fullName: widget.fullName,
                                    aboutYou: widget.aboutYou,
                                    dob: widget.dob,
                                    hobbies: chosenHoppy,
                                    token: widget.token,
                                  )));
                      // Navigator.pushNamed(context, '/step3');
                    },
                    str: 'Next',
                    backgroundColor: Colors.black87,
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
        if (_isSelected)
          chosenHoppy.remove(widget.txt);
        else
          chosenHoppy.add(widget.txt);
        setState(() {
          _isSelected = !_isSelected;
        });
        print("Hoppy list: $chosenHoppy");
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
