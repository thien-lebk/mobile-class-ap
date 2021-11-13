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
                            Text('Step 1 of 3\nLet\'s get to know each other',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )),
                      Image.asset('assets/screens/step.png',
                          fit: BoxFit.fitHeight),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 248, 207, 97))),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your name'),
                    SizedBox(height: 5.0),
                    Container(
                        height: 40.0,
                        child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 2.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32.0))))),
                    SizedBox(height: 20.0),
                    Text('Date of birth'),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Day",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 2.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)))),
                        ),
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Month",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 2.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)))),
                        ),
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Year",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 2.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)))),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text('About you'),
                    SizedBox(height: 5.0),
                    Container(
                        height: 80.0,
                        child: TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            maxLines: 5,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 2.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0))))),
                    SizedBox(height: 20.0),
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
