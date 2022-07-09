import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/core/viewmodels/auth_provider.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/dialog/loading_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/helper/metamask_helper.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/common.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:wallet_sdk_metamask/wallet_sdk_metamask.dart';
import '../widgets/utils/assets_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;

  bool _isShowPassword = true;

  var _session, _uri;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MetamaskHelper().listenEvent(
        callback: (value1) {},
        payloadCallBack: (value2) {},
        disconnectCallBack: (value3) {});
    return Scaffold(body: Builder(builder: (context) {
      return Consumer<AuthProvider>(builder: (context, auth, _) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(top: 50.sm),
                    width: 250.w,
                    height: 200.w,
                    child: Image.asset(
                      AssetsUtils.IMAGES_WELLCOME,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.sm),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Languages.of(context)!.hi,
                        style: TextStyles.textSize34MainColor,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.sm),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: Languages.of(context)!.titleWelcome,
                          style: TextStyles.textBold14R,
                          children: <TextSpan>[
                            TextSpan(
                                text: Languages.of(context)!.appName,
                                style: TextStyles.text16R400UNDERLINE),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sm,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.sm),
                    child: Common().editTextCommon(
                        hintValue: Languages.of(context)!.phoneNumber,
                        wLeft: SvgPicture.asset(
                          AssetsUtils.PHONE_ICON,
                        ),
                        controller: _userNameController),
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
                        ),
                        wRight: _isShowPassword == true
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.visibility_off),
                        obscureText: _isShowPassword,
                        onClick: () {
                          setState(() {
                            _isShowPassword = !_isShowPassword;
                          });
                        },
                        controller: _passwordController),
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
                          String userName = _userNameController.text.trim();
                          String password = _passwordController.text.trim();
                          Logger().i("LOngkaka");
                          if (userName.isEmpty || password.isEmpty) {
                            return;
                          }
                          Logger().i("LOngkaka");
                          LoadingScreen().show(
                              context: context,
                              text: Languages.of(context)!.textLoading);
                          auth.login(context, userName, password);
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
                      InkWell(
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          margin: EdgeInsets.all(20.sm),
                          child: Image.asset(AssetsUtils.METAMASK_ICON),
                        ),
                        onTap: () {
                          MetamaskHelper().loginUsingMetamask(context, _uri,
                              callback: (value) {
                                  setState(() {
                                    _session = value;
                                  });
                              });
                        },
                      )
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
