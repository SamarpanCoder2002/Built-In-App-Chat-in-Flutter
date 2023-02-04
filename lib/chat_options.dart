import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ChatPopUpOptions extends StatefulWidget {
  const ChatPopUpOptions({Key? key}) : super(key: key);

  @override
  State<ChatPopUpOptions> createState() => _ChatPopUpOptionsState();
}

class _ChatPopUpOptionsState extends State<ChatPopUpOptions> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      position: PopupMenuPosition.under,
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (context) {
        return [
         PopupMenuItem(
           value: 'New Chat',
           child: const ListTile(
             leading: Icon(CupertinoIcons.chat_bubble_2_fill),
             title: Text('Create New Chat', maxLines: 1,),
           ),
           onTap: (){
             ZIMKit().showDefaultNewPeerChatDialog(context);
           },
         ), PopupMenuItem(
           value: 'Create New Group',
           child: const ListTile(
             leading: Icon(CupertinoIcons.group_solid),
             title: Text('Create New Group', maxLines: 1,),
           ),
           onTap: (){
             ZIMKit().showDefaultNewGroupChatDialog(context);
           },
         ), PopupMenuItem(
           value: 'Join New Group',
           child: const ListTile(
             leading: Icon(Icons.group_add),
             title: Text('Join New Group', maxLines: 1,),
           ),
           onTap: (){
             ZIMKit().showDefaultJoinGroupDialog(context);
           },
         ),
        ];
      },
    );
  }
}
