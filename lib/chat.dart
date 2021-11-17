import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:collection/collection.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamChat(
        child: ChannelListPage(),
        client: widget.client,
      ),
    );
  }
}

class ChannelListPage extends StatelessWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChannelsBloc(
        child: ChannelListView(
          filter: Filter.in_(
            'members',
            [StreamChat.of(context).currentUser!.id],
          ),
          channelPreviewBuilder: _channelPreviewBuilder,
          sort: [SortOption('last_message_at')],
          limit: 20,
          channelWidget: const ChannelPage(),
        ),
      ),
    );
  }

  Widget _channelPreviewBuilder(BuildContext context, Channel channel) {
    final lastMessage = channel.state?.messages.reversed.firstWhereOrNull(
      (message) => !message.isDeleted,
    );

    final subtitle = lastMessage == null ? 'nothing yet' : lastMessage.text!;
    final opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

    final theme = StreamChatTheme.of(context);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StreamChannel(
              channel: channel,
              child: const ChannelPage(),
            ),
          ),
        );
      },
      leading: ChannelAvatar(
        channel: channel,
      ),
      title: ChannelName(
        textStyle: theme.channelPreviewTheme.titleStyle!.copyWith(
          color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
        ),
      ),
      subtitle: Text(subtitle),
      trailing: channel.state!.unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              child: Text(channel.state!.unreadCount.toString()),
            )
          : const SizedBox(),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              threadBuilder: (_, parentMessage) => ThreadPage(
                parent: parentMessage,
              ),
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  const ThreadPage({
    Key? key,
    this.parent,
  }) : super(key: key);

  final Message? parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThreadHeader(
        parent: parent!,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              parentMessage: parent,
            ),
          ),
          MessageInput(
            parentMessage: parent,
          ),
        ],
      ),
    );
  }
}
