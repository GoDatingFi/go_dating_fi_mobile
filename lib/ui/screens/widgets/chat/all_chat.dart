import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';

import '../../../../core/model/chat/message_model.dart';
import '../../chat/chat_room.dart';
import '../utils/app_theme.dart';
import '../utils/text_style.dart';

class AllChats extends StatelessWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: allChats.length,
            itemBuilder: (context, int index) {
              final allChat = allChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: 46.sm,
                              backgroundImage: AssetImage(allChat.avatar!),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  radius: 10.sm,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                      width: 13.sm,
                                      height: 13.sm,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colours.MAIN_COLOR,
                                      )),
                                ),
                              )),
                        ],
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
                              style: TextStyles.textBold18,
                            ),
                            Text(
                              allChat.text!,
                              style: TextStyles.textBold14R,
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
                            style: TextStyles.textSize12r,
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
