import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 20,
                          backgroundImage: NetworkImage(image1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alaa Mohamed",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.video_camera_solid,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Video",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          "9:00 PM",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
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
