import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../../core/model/profile_model.dart';


class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key, required this.profile }) : super(key: key);
  final Profile profile;
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: StoryView(
                  controller: controller,
                  storyItems: [
                    StoryItem.inlineImage(
                      url:
                      profile.imageAsset1,
                      controller: controller,
                      imageFit: BoxFit.fitHeight,
                    ),
                    StoryItem.inlineImage(
                      url:
                      profile.imageAsset2,
                      controller: controller,
                      imageFit: BoxFit.fitHeight,
                    )
                  ],
                  onStoryShow: (s) {
                    print("Showing a story");
                  },
                  onComplete: () {
                    print("Completed a cycle");
                  },
                  progressPosition: ProgressPosition.top,
                  repeat: false,
                  inline: false,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: 440,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      profile.distance,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
