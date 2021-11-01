import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/joinUs': (context) => JoinUs(),
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
            ),
          ),
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
                            style:
                                TextStyle(fontSize: 48, color: Colors.white)),
                        Text(
                          'Explore friends - Workout together',
                          style: TextStyle(color: Colors.white),
                        )
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

//! Join Us page
//!----------------------------------------------
class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  bool isVisible = false;
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
              'https://images.pexels.com/photos/1670187/pexels-photo-1670187.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
        )),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(64.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Join Us'),
                            Text('Sign In'),
                          ],
                        ),
                        TextField(
                            decoration: InputDecoration(labelText: 'Email')),
                        TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: Icon(Icons.visibility_off))),
                        TextField(
                            obscureText: isVisible ? false : true,
                            decoration: InputDecoration(
                                labelText: 'Confirm password',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      print('toggle obscure text');
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)))),
                        CustomButton(
                          onTap: () {},
                          str: 'Join Us',
                          backgroundColor: Colors.grey,
                          borderColor: Colors.transparent,
                          textColor: Colors.white,
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}

//!----------------------------------------------

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
      this.width = 120.0})
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
                borderRadius: BorderRadius.circular(12)),
            width: width,
            height: 32,
            child: Center(
                child: Text(
              str,
              style: TextStyle(color: textColor),
            ))));
  }
}
//!----------------------------------------------