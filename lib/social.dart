import 'package:flutter/material.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Column(
          children: [
            Text('Trang chính'),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/chat');
                },
                child: Text('Nhấn vô để làm trang chat')),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/exercise');
                },
                child: Text('Nhấn vô để làm trang exercise'))
          ],
        )),
      ),
    );
  }
}
