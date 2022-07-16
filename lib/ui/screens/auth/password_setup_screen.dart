import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/language/languages.dart';
import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/colors.dart';
import '../widgets/utils/common.dart';
import '../widgets/utils/text_style.dart';

class PasswordSetupScreen extends StatefulWidget {
  const PasswordSetupScreen({Key? key}) : super(key: key);

  @override
  _PasswordSetupScreenState createState() => _PasswordSetupScreenState();
}

class _PasswordSetupScreenState extends State<PasswordSetupScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;

  bool _isShowPassword = true;

  @override
  void initState() {
    _confirmController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.15.sh),
                Text(
                  Languages.of(context)!.titlePasswordSetup,
                  style: TextStyles.textSize34S,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 0.01.sh),
                Text(
                  Languages.of(context)!.desPasswordSetup,
                  style: TextStyles.textBold16TextNormal,
                ),
                SizedBox(height: 0.1.sh),
                Container(
                  child: Common().editTextCommon(
                      hintValue: Languages.of(context)!.titleCreatePassword,
                      wLeft: SvgPicture.asset(
                        AssetsUtils.PASSWORD_ICON,
                      ),
                      wRight: const Icon(Icons.paragliding_outlined),
                      onClick: () {
                        setState(() {});
                      },
                      controller: _confirmController),
                ),
                SizedBox(height: 0.02.sh),
                Container(
                  child: Common().editTextCommon(
                      hintValue: Languages.of(context)!.titleConfirmPassword,
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
              ],
            ),
            Positioned(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 50.sm, left: 16.sm, right: 16.sm),
                      child: Common().buttonCommon(
                          strTitle: Languages.of(context)!.textContinue,
                          dHeight: 32.h,
                          onClick: () {}),
                    )))
          ],
        ),
      ),
    );
  }
}
