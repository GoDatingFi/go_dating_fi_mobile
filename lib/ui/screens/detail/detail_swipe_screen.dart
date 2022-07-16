import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';

import '../widgets/language/languages.dart';
import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/text_style.dart';

class DetailSwipeScreen extends StatefulWidget {
  const DetailSwipeScreen({Key? key}) : super(key: key);

  @override
  _DetailSwipeScreenState createState() => _DetailSwipeScreenState();
}

class _DetailSwipeScreenState extends State<DetailSwipeScreen> {
  final imageList = [
    'https://i.pinimg.com/564x/75/2f/27/752f27fcb8089e58f641c3613a193a35.jpg',
    'https://i.pinimg.com/474x/6e/48/91/6e489140de4ff27fe68284203006a710.jpg',
    'https://i.pinimg.com/474x/25/c8/29/25c8296b598f57a147d17671dfde0d35.jpg',
    'https://i.pinimg.com/474x/74/f7/f0/74f7f004d37f18af43dafeef23cd01c8.jpg',
    'https://i.pinimg.com/474x/25/c8/29/25c8296b598f57a147d17671dfde0d35.jpg',
    'https://i.pinimg.com/474x/74/f7/f0/74f7f004d37f18af43dafeef23cd01c8.jpg',
  ];

  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: indicators(
                                      imageList.length, activePage))))
                    ],
                  )),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                margin: EdgeInsets.only(left: 10.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Madeline, 20',
                          style: TextStyles.textSize34SBlack,
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: 10.sm),
                            child: Image.asset(AssetsUtils.CLOSE),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.r),
                    _aboutUser(),
                    SizedBox(height: 10.r),
                    Text(
                      'About',
                      style: TextStyles.textSize16T,
                    ),
                    SizedBox(height: 5.r),
                    Text(
                      "Ultrices ut a ac dolor egestas at facilisis aliquet. Dignissim morbi cras euismod. Lorem ipsum dolor sit amet, consectetur ",
                      style: TextStyles.textBold16TextNormal,
                    ),
                    SizedBox(height: 10.r),
                    _photoUser(),
                    SizedBox(height: 10.r),
                    _interests(),
                    SizedBox(height: 10.r),
                    _myAnthem()
                  ],
                ))
          ],
        )),
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

  Widget _aboutUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AssetsUtils.SEAFARER,
            ),
            SizedBox(width: 5.r),
            Text(
              'Seafarer at New York',
              style: TextStyles.textBold16TextName,
            ),
          ],
        ),
        SizedBox(height: 5.r),
        Row(
          children: [
            SvgPicture.asset(
              AssetsUtils.UNIVERSITY,
            ),
            SizedBox(width: 5.r),
            Text(
              'AMET University',
              style: TextStyles.textBold16TextName,
            ),
          ],
        ),
        SizedBox(height: 5.r),
        Row(
          children: [
            SvgPicture.asset(
              AssetsUtils.SEX_ICON,
            ),
            SizedBox(width: 5.r),
            Text(
              'GIRL',
              style: TextStyles.textBold16TextName,
            ),
          ],
        ),
        SizedBox(height: 5.r),
        Row(
          children: [
            SvgPicture.asset(
              AssetsUtils.HOME,
            ),
            SizedBox(width: 5.r),
            Text(
              'Lives in Chennai',
              style: TextStyles.textBold16TextName,
            ),
          ],
        ),
        SizedBox(height: 5.r),
        Row(
          children: [
            SvgPicture.asset(
              AssetsUtils.LOCATION,
              color: Colours.TIME_COLOR,
            ),
            SizedBox(width: 5.r),
            Text(
              '25 kilometers away',
              style: TextStyles.textBold16TextName,
            ),
          ],
        )
      ],
    );
  }

  _photoUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Photos',
          style: TextStyles.textSize16T,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10.r),
        SizedBox(
          height: 100.sm,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: imageList.map((i) {
              return Container(
                  margin: EdgeInsets.all(5.r),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 88.sm,
                    height: 88.sm,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        i,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ));
            }).toList(),
          ),
        )
      ],
    );
  }

  _interests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Interests',
          style: TextStyles.textSize16T,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10.r),
        Container(
          margin: EdgeInsets.only(top: 10.sm, bottom: 10.sm),
          child: Wrap(
              direction: Axis.horizontal,
              children: List<Widget>.generate(
                  Languages.of(context)!.listHobby.length,
                  (j) => Container(
                      margin: EdgeInsets.all(5.sm),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sm, horizontal: 10.sm),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99.sm),
                        color:
                            j % 2 == 0 ? Colours.SHADOWN : Colours.TEXT_HIGHT,
                        boxShadow: const [
                          BoxShadow(color: Colours.TIME_COLOR, spreadRadius: 1),
                        ],
                      ),
                      child: Text(
                        Languages.of(context)!.listHobby[j],
                        style: TextStyles.textBold16TextName,
                      )))),
        )
      ],
    );
  }

  _myAnthem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'My Anthem',
          style: TextStyles.textSize16T,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10.r),
        Row(
          children: [
            SizedBox(
              width: 50.sm,
              height: 50.sm,
              child: Image.asset(AssetsUtils.GALLERY, fit: BoxFit.fill),
            ),
            SizedBox(width: 10.r),
            Column(
              children: [
                Text(
                  'We Find Love',
                  style: TextStyles.textBold16TextName,
                ),
                Text(
                  'Daniel Caesar',
                  style: TextStyles.textBold14RText,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
