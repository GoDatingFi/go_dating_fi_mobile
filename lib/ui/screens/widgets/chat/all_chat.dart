import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/chat/message_model.dart';
import '../../chat/chat_room.dart';
import '../utils/app_theme.dart';

class AllChats extends StatelessWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: const [
              Text(
                'All Chats',
                style: MyTheme.heading2,
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: allChats.length,
            itemBuilder: (context, int index) {
              final allChat = allChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(allChat.avatar!),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                                return ChatRoom(user: allChat.sender);
                              }));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              allChat.sender!.name!,
                              style: MyTheme.heading2.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              allChat.text!,
                              style: MyTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          allChat.unreadCount == 0
                              ? Icon(
                            Icons.done_all,
                            color: MyTheme.bodyTextTime.color,
                          )
                              : CircleAvatar(
                            radius: 8,
                            backgroundColor: MyTheme.kUnreadChatBG,
                            child: Text(
                              allChat.unreadCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            allChat.time!,
                            style: MyTheme.bodyTextTime,
                          )
                        ],
                      ),
                    ],
                  ));
            })
      ],
    );
  }
}
