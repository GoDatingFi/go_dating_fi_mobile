import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/core/viewmodels/auth_provider.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/common.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';
import 'package:provider/provider.dart';

import '../../router/fluro_navigator.dart';
import '../../router/router_generator.dart';
import '../widgets/utils/assets_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Consumer<AuthProvider>(builder: (context, auth, _) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100.sm),
                    width: 0.1.sw,
                    height: 0.1.sw,
                    child: Image.asset(
                      AssetsUtils.LOGO_TRANSPARENT,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                  Text(
                    Languages.of(context)!.appName,
                    style: TextStyles.textSize34MainColor,
                  ),
                  SizedBox(
                    height: 100.sm,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.sm),
                    child: Common().editTextCommon(
                        hintValue: Languages.of(context)!.phoneNumber,
                        wLeft: SvgPicture.asset(
                          AssetsUtils.PHONE_ICON,
                        )),
                  ),
                  SizedBox(
                    height: 16.sm,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.sm),
                    child: Common().editTextCommon(
                        hintValue: Languages.of(context)!.password,
                        wLeft: SvgPicture.asset(
                          AssetsUtils.PASSWORD_ICON,
                        )),
                  ),
                  SizedBox(
                    height: 16.sm,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Languages.of(context)!.forgotPassword,
                        style: TextStyles.textBold16Text,
                      ),
                      Container(
                        width: 16.sm,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.sm,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.sm),
                    child: Common().buttonCommon(
                        strTitle: Languages.of(context)!.login,
                        dHeight: 32.h,
                        onClick: () {
                          NavigatorUtils.pushReplacementNamed(
                              context, RouterGenerator.routeHome);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.sm),
                    child: Text(Languages.of(context)!.loginWith,
                        style: TextStyles.textBold16TextNormal),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.all(20.sm),
                        child: SvgPicture.asset(
                          AssetsUtils.FACE_ICON,
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.all(20.sm),
                        child: SvgPicture.asset(
                          AssetsUtils.GOOGLE_ICON,
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.all(20.sm),
                        child: SvgPicture.asset(
                          AssetsUtils.TWITTER_ICON,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            KeyboardVisibilityBuilder(builder: (context, visible) {
              return Visibility(
                  visible: !visible,
                  child: Positioned(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: InkWell(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                              child: RichText(
                                text: TextSpan(
                                  text: Languages.of(context)!.newMember,
                                  style: TextStyles.textBold14N,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: Languages.of(context)!.register,
                                        style: TextStyles.textBold16Text),
                                  ],
                                ),
                              )),
                          onTap: () {},
                        )),
                  ));
            }),
            const SizedBox(
              height: 30,
            )
          ],
        );
      });
    }));
  }
}
