import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwad_two/const.dart';

import 'models/chat_model.dart';

class WhatsappScreen extends StatefulWidget {
  const WhatsappScreen({super.key});

  @override
  State<WhatsappScreen> createState() => _WhatsappScreenState();
}

class _WhatsappScreenState extends State<WhatsappScreen> {
  List<ChatModel> chatList = [];

  @override
  void initState() {
    // for(var item in jsonList){
    //   final chat = ChatModel.fromJson(item);
    //   chatList.add(chat);
    // }
    chatList = jsonList.map((e) => ChatModel.fromJson(e)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildCustomChats(
              text: "Locked Chats",
              icon: CupertinoIcons.lock_fill,
            ),
            _buildCustomChats(
              text: "Archive Chats",
              icon: CupertinoIcons.archivebox_fill,
              count: 5,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: chatList.length,
                  separatorBuilder: (context, index) => Divider(
                        height: 20,
                      ),
                  itemBuilder: (context, index) =>
                      _buildChatItem(chatList[index])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(ChatModel chat) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 20,
          backgroundImage: NetworkImage(chat.image!),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                chat.msg!,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Spacer(),
        Text(
          chat.createdAt ?? "",
          style: TextStyle(
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }

  Widget _buildCustomChats({
    required String text,
    required IconData icon,
    int? count,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (count != null) Text(count.toString()),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF438046),
      title: Text(
        "WhatsApp",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      actions: [
        Icon(
          CupertinoIcons.camera,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          CupertinoIcons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
