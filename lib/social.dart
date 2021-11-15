import 'package:flutter/material.dart';
import 'package:phinder/chat.dart';
import 'package:phinder/common.dart';
import 'package:phinder/exercise.dart';
import 'package:phinder/explore.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Common(),
              ExerciseScreen(),
              ChatScreen(),
            ],
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[500],
            tabs: [
              Tab(child: Text('Explore')),
              Tab(child: Text('Exercise')),
              Tab(child: Text('Chat')),
            ],
          ),
        ),
      ),
    );
  }
}
