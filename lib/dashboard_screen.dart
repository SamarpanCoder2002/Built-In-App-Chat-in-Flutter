import 'package:flutter/material.dart';
import 'package:inapp_chat_project/config.dart';
import 'package:zego_zimkit/compnents/compnents.dart';
import 'package:zego_zimkit/pages/pages.dart';

import 'chat_options.dart';

class DashBoardScreen extends StatefulWidget {
  final String userId;

  const DashBoardScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0155FE),
        elevation: 0,
        title: const Text('Chat and Groups'),
        actions: const [ChatPopUpOptions()],
      ),
      body: Column(
        children: [
          _upperSection(),
          _chatAndGroupsVisibleSection(),
        ],
      ),
    );
  }

  _upperSection() {
    return InkWell(
      onTap: () {
        copyText(widget.userId);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Copied')));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          'User Id: ${widget.userId}',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  _chatAndGroupsVisibleSection() {
    return Expanded(child: ZIMKitConversationListView(
      onPressed: (context, conversation, defaultAction) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ZIMKitMessageListPage(
                    conversationID: conversation.id,
                    conversationType: conversation.type)));
      },
    ));
  }
}
