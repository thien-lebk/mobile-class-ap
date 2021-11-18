import 'package:flutter/material.dart';
import 'package:phinder/chat.dart';
import 'package:phinder/common.dart';
import 'package:phinder/detail.dart';
import 'package:phinder/exercise.dart';
import 'package:phinder/explore.dart';
import 'package:phinder/finish.dart';
import 'package:phinder/forgot.dart';
import 'package:phinder/joinus.dart';
import 'package:phinder/signin.dart';
import 'package:phinder/social.dart';
import 'package:phinder/step1.dart';
import 'package:phinder/step2.dart';
import 'package:phinder/step3.dart';
import 'package:phinder/match.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/workout/arm.dart';
import 'package:phinder/workout/leg.dart';
import 'package:phinder/workout/abs.dart';
import 'package:phinder/workout/fullbody.dart';
import 'package:phinder/workout/butt.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:phinder/post.dart';

void main() async {
  final client = StreamChatClient(
    'b67pax5b2wdq',
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'tutorial-flutter'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
  );

  runApp(
    MyApp(
      client: client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/joinUs': (context) => JoinUs(),
        '/common': (context) => Common(
              token: '-',
            ),
        '/signIn': (context) => SignIn(client: client),
        '/forgot': (context) => Forgot(),
        '/chat': (context) => ChatScreen(client: client),
        '/social': (context) => Social(
              token: '-',
              client: client,
            ),
        '/exercise': (context) => ExerciseScreen(),
        '/step1': (context) => Step1(),
        // '/step2': (context) => Step2(
        //       fullName: '-',
        //       aboutYou: '-',
        //       dob: '-',
        //       listHoppy: [],
        //       token: '-',
        //     ),
        // '/step3': (context) => Step3(
        //     fullName: '-', aboutYou: '-', dob: '-', hobbies: [], token: '-'),
        '/finish': (context) => Finish(client: client),
        // '/explore': (context) => Explore(userInfo: UserInfo,),
        // '/detail': (context) => Detail(),
        '/match': (context) => Match(),
        '/abs': (context) => AbsWorkout(),
        '/arm': (context) => ArmWorkout(),
        '/leg': (context) => LegWorkout(),
        '/fullbody': (context) => FullBodyWorkout(),
        '/butt': (context) => ButtWorkout(),
        '/post': (context) => Post(),
      },
    );
  }
}

//! Start page
//!----------------------------------------------
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://images.pexels.com/photos/6740316/pexels-photo-6740316.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: Container()),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phinder',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                textStyle: TextStyle(
                                    fontSize: 48, color: Colors.white))),
                        Text('Explore friends - Workout together',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                textStyle: TextStyle(fontSize: 18)))
                      ],
                    ),
                  )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      onTap: () {
                        print('Tap Join Us button!');
                        Navigator.pushNamed(context, '/joinUs');
                      },
                      str: 'Join Us',
                      backgroundColor: Colors.white,
                      borderColor: Colors.transparent,
                      textColor: Colors.black),
                  CustomButton(
                      onTap: () {
                        print('Tap Sign In button!');
                        Navigator.pushNamed(context, '/signIn');
                      },
                      str: 'Sign In',
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.white,
                      textColor: Colors.white),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

//! Component
//!----------------------------------------------
class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.str,
      required this.backgroundColor,
      required this.borderColor,
      required this.textColor,
      this.width = 162.0})
      : super(key: key);
  final VoidCallback onTap;
  final String str;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double width;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: backgroundColor,
                borderRadius: BorderRadius.circular(32)),
            width: width,
            height: 48,
            child: Center(
                child: Text(
              str,
              style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  textStyle: TextStyle(fontSize: 16)),
            ))));
  }
}
//!----------------------------------------------