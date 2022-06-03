import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/constants.dart';
import 'utils/text_style.dart';

PreferredSize appBarCommon(BuildContext context,
    {String? strAvatar,
      String? strName,
      String? strStatus,
      String? strDescription,
      String? textStories,
      String? textInteract,
      int? countStories,
      int? countInteract,
      bool? isHide = true,
      bool? isIconBack = false,
      VoidCallback? onPressed}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(180.0), //// here the desired height
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        //// hides leading widget
        elevation: 0,
        leading: isIconBack!
            ? IconButton(
          icon: const Icon(Icons.arrow_back, color: Colours.TEXT),
          onPressed: () => Navigator.of(context).pop(),
        )
            : Container(),
        flexibleSpace: Container(
          margin: const EdgeInsets.only(top: 50),
          child: IntrinsicWidth(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Visibility(
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(textStories ?? "",
                                    style: TextStyles.textSize18T),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text("$countStories",
                                      style: TextStyles.text16R),
                                ),
                              ],
                            ),
                          ),
                          visible: isHide!,
                        )),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: SizedBox(
                              height: 90,
                              width: 90,
                              child: Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.expand,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        strAvatar ?? Constants.IMAGE_DEFAULT),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: RawMaterialButton(
                                          onPressed: () {},
                                          elevation: 0.0,
                                          fillColor: Colours.BG_IMAGE,
                                          child: const SizedBox(
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: 15,
                                              )),
                                          padding: const EdgeInsets.all(2.0),
                                          shape: const CircleBorder(),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            onTap: () => onPressed!(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Visibility(
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("$textInteract",
                                    style: TextStyles.textSize18T),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text("$countInteract",
                                      style: TextStyles.text16R),
                                ),
                              ],
                            ),
                          ),
                          visible: isHide,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        Text(
                          strName ?? "",
                          style: TextStyles.textSize18T,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "$strDescription",
                          style: TextStyles.text14R,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        shape: const Border(
            bottom: BorderSide(color: Colours.SHADOWN_APP_BAR, width: 2)),
      ),
    ),
  );
}