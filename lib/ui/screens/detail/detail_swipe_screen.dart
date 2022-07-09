import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';

import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/text_style.dart';

class DetailSwipeScreen extends StatefulWidget {
  const DetailSwipeScreen({Key? key}) : super(key: key);

  @override
  _DetailSwipeScreenState createState() => _DetailSwipeScreenState();
}

class _DetailSwipeScreenState extends State<DetailSwipeScreen> {
  late PageController _pageController;

  final imageList = [
    'https://i.pinimg.com/564x/75/2f/27/752f27fcb8089e58f641c3613a193a35.jpg',
    'https://i.pinimg.com/474x/6e/48/91/6e489140de4ff27fe68284203006a710.jpg',
    'https://i.pinimg.com/474x/25/c8/29/25c8296b598f57a147d17671dfde0d35.jpg',
    'https://i.pinimg.com/474x/74/f7/f0/74f7f004d37f18af43dafeef23cd01c8.jpg',
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r)))),
                  child: SizedBox(
                      height: 0.7.sh,
                      child: Stack(
                        children: [
                          PageView.builder(
                              itemCount: imageList.length,
                              pageSnapping: true,
                              // controller: _pageController,
                              onPageChanged: (page) {
                                setState(() {
                                  activePage = page;
                                });
                              },
                              itemBuilder: (context, pagePosition) {
                                //checking active position
                                bool active = pagePosition == activePage;
                                return slider(imageList, pagePosition, active);
                              }),
                          Positioned.fill(
                              bottom: 10.sm,
                              child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: indicators(
                                          imageList.length, activePage))))
                        ],
                      ))),
              SizedBox(
                height: 5.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Madeline, 20',
                      style: TextStyles.textSize34SBlack,
                    ),
                    Text(
                      'Seafarer at New York',
                      style: TextStyles.textBold18RBlack,
                    ),
                  ],
                ),
              )
            ],
          )),
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
