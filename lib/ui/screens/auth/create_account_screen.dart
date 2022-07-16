import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:logger/logger.dart';

import '../widgets/utils/common.dart';
import '../widgets/utils/text_style.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

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
                SizedBox(height: 0.1.sh),
                Text(
                  Languages.of(context)!.titleCreateAccount,
                  style: TextStyles.textSize34S,
                  textAlign: TextAlign.left,
                ),
                Text(
                  Languages.of(context)!.desCreateAccount,
                  style: TextStyles.textBold16TextNormal,
                ),
                SizedBox(height: 0.1.sh),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.r, horizontal: 10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colours.TIME_COLOR, spreadRadius: 1),
                      ],
                    ),
                    child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                Logger().i(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                Logger().i(value);
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle:
                                  const TextStyle(color: Colors.black),
                              initialValue: number,
                              textFieldController: controller,
                              formatInput: false,
                              cursorColor: Colours.TEXT,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              inputBorder: const OutlineInputBorder(),
                              onSaved: (PhoneNumber number) {
                                Logger().i(number);
                              },
                            ),
                          ],
                        )))
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

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
