import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';

import '../../../../core/model/chat/message_model.dart';
import '../utils/assets_utils.dart';

class ListMatchingHorizon extends StatelessWidget {
  const ListMatchingHorizon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170.sm,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: recentChats.length,
            itemBuilder: (context, int index) {
              final recentChat = recentChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50.sm,
                            backgroundColor: Colours.MAIN_COLOR,
                            child: CircleAvatar(
                                radius: 48.sm,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 46.sm,
                                  backgroundImage:
                                      AssetImage(recentChat.avatar!),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      width: 24.sm,
                                      height: 24.sm,
                                      margin: const EdgeInsets.only(
                                          left: 1, bottom: 10),
                                      child: SvgPicture.asset(
                                        AssetsUtils.FIRE_ICON,
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.sm,
                      ),
                      Text(recentChat.sender!.name!,
                          style: TextStyles.textBold14R,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ));
            }));
  }
}
