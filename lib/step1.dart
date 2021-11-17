import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:phinder/step2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool isVisible = false;
  String fullName = "";
  String day = "";
  String month = "";
  String year = "";
  String dob = "";
  String aboutYou = "";

  @override
  Widget build(BuildContext context) {
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
                            Text('Step 1 of 3\nLet\'s get to know each other',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
                          ],
                        ),
                      )),
                      Image.asset('assets/screens/step.png',
                          fit: BoxFit.fitHeight),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 248, 207, 97))),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YOUR NAME',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                          height: 40.0,
                          child: TextField(
                              onChanged: (val) {
                                fullName = val;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 2.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))))),
                      SizedBox(height: 20.0),
                      Text(
                        'DATE OF BIRTH',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextField(
                                onChanged: (val) {
                                  day = val;
                                },
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
                                onChanged: (val) {
                                  month = val;
                                },
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
                                onChanged: (val) {
                                  year = val;
                                },
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
                      Text(
                        'ABOUT YOU',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                          height: 80.0,
                          child: TextField(
                              onChanged: (val) {
                                aboutYou = val;
                              },
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
                        onTap: () async {
                          print('Your name: $fullName');
                          if (day.length == 1) day = "0" + day;
                          if (month.length == 1) month = "0" + month;
                          dob =
                              year + "-" + month + "-" + day + "T00:00:00.000Z";
                          print('Date of birth: $dob');
                          print('About you: $aboutYou');
                          if (fullName.length == 0) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              headerAnimationLoop: false,
                              title: "Note",
                              desc: "Please input your name !",
                              btnCancelColor: Colors.red,
                              btnCancelOnPress: () {},
                              btnCancelText: 'Close',
                            ).show();
                          } else if (day.length == 0 ||
                              day.length > 2 ||
                              int.parse(month) < 1 ||
                              int.parse(month) > 31) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              headerAnimationLoop: false,
                              title: "Note",
                              desc: "Day of birth must from 1 to 31 !",
                              btnCancelColor: Colors.red,
                              btnCancelOnPress: () {},
                              btnCancelText: 'Close',
                            ).show();
                          } else if (month.length == 0 ||
                              month.length > 2 ||
                              int.parse(month) < 1 ||
                              int.parse(month) > 12) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              headerAnimationLoop: false,
                              title: "Note",
                              desc: "Month of birth must from 1 to 12 !",
                              btnCancelColor: Colors.red,
                              btnCancelOnPress: () {},
                              btnCancelText: 'Close',
                            ).show();
                          } else if (year.length != 4 ||
                              int.parse(year) < 1900 ||
                              int.parse(year) > 2021) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              headerAnimationLoop: false,
                              title: "Note",
                              desc: "Year of birth must from 1900 to 2021 !",
                              btnCancelColor: Colors.red,
                              btnCancelOnPress: () {},
                              btnCancelText: 'Close',
                            ).show();
                          } else {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            String token = prefs.getString('token') ?? "*";
                            List<UserHobby> lUserHoppy =
                                await getHoppy(token: token);
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step2(
                                          fullName: fullName,
                                          aboutYou: aboutYou,
                                          dob: dob,
                                          listHoppy: lUserHoppy,
                                          token: token,
                                        )));
                          }
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
            ),
          )),
    );
  }
}
