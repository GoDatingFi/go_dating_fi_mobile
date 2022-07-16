import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/detail/detail_swipe_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';

import '../../../../core/model/profile_model.dart';
import '../utils/assets_utils.dart';

const duration = Duration(milliseconds: 300);

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> with RouteAware {
  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.72.sh,
      width: 0.95.sw,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          ClipPath(
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                          bottomLeft: Radius.circular(24.r),
                          bottomRight: Radius.circular(24.r)))),
              child: SizedBox(
                  height: 0.7.sh,
                  child: Stack(
                    children: [
                      PageView.builder(
                          itemCount: 2,
                          pageSnapping: true,
                          // controller: _pageController,
                          onPageChanged: (page) {
                            // setState(() {
                            //   activePage = page;
                            // });
                          },
                          itemBuilder: (context, pagePosition) {
                            //checking active position
                            bool active = pagePosition == activePage;
                            return slider([
                              widget.profile.imageAsset1,
                              widget.profile.imageAsset1
                            ], pagePosition, active);
                          }),
                      Positioned.fill(
                          bottom: 10.sm,
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: indicators(2, activePage))))
                    ],
                  ))),
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
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.profile.name,
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
                            child: Text(widget.profile.distance,
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
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(
                          alignment: Alignment.center,
                          scale: Tween<double>(begin: 0.1, end: 1).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.bounceIn,
                            ),
                          ),
                          child: child,
                        );
                      },
                      transitionDuration: duration,
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return const DetailSwipeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                images[pagePosition],
              ),
              fit: BoxFit.cover)),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3.sm),
        width: 7.w,
        height: 7.h,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Colours.MAIN_COLOR
                : Colours.UN_SELECTED,
            shape: BoxShape.circle),
      );
    });
  }
}
