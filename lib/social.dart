import 'package:flutter/material.dart';
import 'package:phinder/api.dart';
import 'package:phinder/chat.dart';
import 'package:phinder/common.dart';
import 'package:phinder/exercise.dart';
import 'package:phinder/explore.dart';
import 'package:phinder/news.dart';
import 'package:phinder/profile.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Social extends StatefulWidget {
  const Social({
    Key? key,
    required this.token,
    required this.client,
  }) : super(key: key);

  final String token;
  final StreamChatClient client;

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: SafeArea(
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Common(
                token: widget.token,
              ),
              ExerciseScreen(),
              ChatScreen(client: widget.client),
              NewsPage(),
              Profile()
            ],
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[500],
            tabs: [
              Tab(child: Text('Explore', style: TextStyle(fontSize: 12))),
              Tab(child: Text('Exercise', style: TextStyle(fontSize: 12))),
              Tab(child: Text('Chat', style: TextStyle(fontSize: 12))),
              Tab(child: Text('Trend', style: TextStyle(fontSize: 12))),
              Tab(child: Text('Profile', style: TextStyle(fontSize: 12))),
            ],
          ),
        ),
      ),
    );
  }
}
