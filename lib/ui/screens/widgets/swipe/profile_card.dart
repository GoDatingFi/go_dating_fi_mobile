import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';

import '../../../../core/model/profile_model.dart';
import '../utils/assets_utils.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.71.sh,
      width: 0.9.sw,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                profile.imageAsset1,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 30.sm,
            child: Container(
              height: 140.sm,
              width: 0.9.sw,
              decoration: ShapeDecoration(
                color: Colors.transparent,
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
                padding: const EdgeInsets.only(left: 20, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profile.name,
                      style: TextStyles.textSize34SWhite,
                    ),
                    Row(
                      children: [
                        Image.asset(AssetsUtils.ONLINE),
                        SizedBox(
                          width: 5.sm,
                        ),
                        Text(
                          "Japan",
                          style: TextStyles.text14RWhite,
                        ),
                        SizedBox(
                          width: 5.sm,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colours.MAIN_COLOR,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(profile.distance,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                    Text(
                      '私は太陽の光です',
                      style: TextStyles.textBold18RWhite,
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
