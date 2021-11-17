import 'package:flutter/material.dart';
import 'package:phinder/api.dart';
import 'package:phinder/chat.dart';
import 'package:phinder/common.dart';
import 'package:phinder/exercise.dart';
import 'package:phinder/explore.dart';
import 'package:phinder/news.dart';

class Social extends StatefulWidget {
  final String token;
  const Social({required this.token, Key? key}) : super(key: key);

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Common(
                token: widget.token,
              ),
              ExerciseScreen(),
              ChatScreen(),
              NewsPage(),
            ],
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[500],
            tabs: [
              Tab(child: Text('Explore')),
              Tab(child: Text('Exercise')),
              Tab(child: Text('Chat')),
              Tab(child: Text('Video')),
            ],
          ),
        ),
      ),
    );
  }
}
