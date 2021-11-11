import "package:flutter/material.dart";
import 'package:phinder/utils/data_utils.dart';
import 'package:phinder/views/friends_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class HomeChat extends StatefulWidget {
  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  final _usernameController = TextEditingController();
  String _usernameError = "";
  bool _loading = false;

  Future<void> _onGoPressed() async {
    final username = _usernameController.text;
    if (username.isNotEmpty) {
      final client = StreamChat.of(context).client;
      final user = client.state.currentUser;

      if (user == null) {
        setState(() => {_loading = true});
        await client.connectUser(
          User(
              id: username,
              extraData: {'image': DataUtils.getUserImage(username)}),
          _usernameController.text,
        );
        setState(() => {_loading = false});
      }

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => FriendsChat()));
    } else {
      setState(() {
        _usernameError = 'Username is not valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final client = StreamChat.of(context).client;
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Center(
          child: _loading
              ? CircularProgressIndicator()
              : Card(
                  elevation: 11,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Welcome to the Chat"),
                        if (client.state.currentUser == null)
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                hintText: "Username",
                                errorText: _usernameError),
                          )
                        else
                          Text('Username: ${client.state.currentUser?.id}'),
                        ElevatedButton(
                            onPressed: _onGoPressed, child: Text("Go"))
                      ],
                    ),
                  ),
                ),
        ));
  }
}
