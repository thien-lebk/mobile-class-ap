import 'package:flutter/material.dart';
import 'package:phinder/views/home_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  StreamChatClient _client = StreamChatClient("", logLevel: Level.INFO);

  @override
  void initState() {
    _client = StreamChatClient('p8gtsndpe3q8', logLevel: Level.INFO);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      builder: (context, child) {
        return StreamChat(
          child: child!,
          client: _client,
        );
      },
      home: HomeChat(),
    );
  }
}
