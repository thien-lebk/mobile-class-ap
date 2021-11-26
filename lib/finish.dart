import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:phinder/social.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Finish extends StatefulWidget {
  const Finish({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
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
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String token = prefs.getString('token') ?? "*";
                  // List<UserInfo> listUser = await getUserList(token: token);

                  await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Social(token: token, client: widget.client)));
                  // Navigator.popAndPushNamed(context, '/social');
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
