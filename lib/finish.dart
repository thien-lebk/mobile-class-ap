import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/main.dart';

class Finish extends StatefulWidget {
  const Finish({Key? key}) : super(key: key);

  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        // child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child:
                      Center(child: Image.asset('assets/screens/congrat.png'))),
              Expanded(
                  child: Center(
                      child: Column(
                children: [
                  Text('Congrats!',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500))),
                  Text('Your account has been set up successfully',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))),
                ],
              ))),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, '/explore');
                },
                str: 'Explore Phinder',
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
