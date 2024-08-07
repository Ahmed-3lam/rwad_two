import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwad_two/const.dart';

import '../whatsapp/models/chat_model.dart';

class MessangerScreen extends StatefulWidget {
  const MessangerScreen({super.key});

  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {
  List<ChatModel> chatList = [];
  @override
  void initState() {
    chatList = jsonList.map((e) => ChatModel.fromJson(e)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GestureDetector(
            // onTap: FocusScope.of(context).unfocus,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  _searchField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 48,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        separatorBuilder: (c, i) => Container(
                              width: 10,
                            ),
                        itemBuilder: (c, i) => _statusItem()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (c, i) => SizedBox(
                            height: 20,
                          ),
                      itemCount: chatList.length,
                      itemBuilder: (c, i) => _chatItem(chatList[i]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _chatItem(ChatModel model) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(model.image ?? ""),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name ?? "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 100,
                child: _msgType(model),
              ),
            ],
          ),
          Spacer(),
          Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _msgType(ChatModel model) {
    if (model.messageType == MessageType.TEXT) {
      return Text(
        model.msg ?? "",
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    } else if (model.messageType == MessageType.VIDEO) {
      return Row(
        children: [
          Icon(CupertinoIcons.videocam_fill),
          Text("Video"),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(Icons.gif),
          Text("GIF"),
        ],
      );
    }
  }

  Stack _statusItem() {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/images/man.jpg"),
        ),
        CircleAvatar(
          radius: 8,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 6,
          ),
        ),
      ],
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(CupertinoIcons.search),
          label: Text("Search"),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          print("hello");
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/man.jpg"),
          ),
        ),
      ),
      title: const Text(
        "Chats",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      actions: [
        const Icon(CupertinoIcons.camera_fill),
        const SizedBox(
          width: 30,
        ),
        const Icon(CupertinoIcons.app_badge),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
