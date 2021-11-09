import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

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