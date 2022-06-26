import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';
import 'dimens.dart';

class Common {
  void showToastErr(String str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showToastSuccess(String str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.blue,
        fontSize: 16.0);
  }

  setSharedPreferences(key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  TextFormField editTextCommon({
    String labelValue = "",
    String hintValue = "",
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? textStyle,
    String? validationErrorMsg,
    bool obscureText = false,
    bool isReadOnly = false,
    Widget? wLeft,
    Widget? wRight,
    VoidCallback? onClick,
  }) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      readOnly: isReadOnly,
      enableInteractiveSelection: true,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          }
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: labelValue,
          hintText: hintValue,
          labelStyle: TextStyles.textBold18R,
          hintStyle: TextStyles.textBold18R,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sm),
            borderSide: const BorderSide(
              color: Colours.TIME_COLOR,
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(15.sm),
            child: wLeft ?? Container(),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(15.sm),
            child: wRight != null
                ? InkWell(
                    child: wRight,
                    onTap: onClick,
                  )
                : const SizedBox(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sm),
            borderSide: const BorderSide(
              color: Colours.TIME_COLOR,
              width: 1.0,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
    return textFormField;
  }

  Widget buttonCommon(
      {String? strTitle,
      VoidCallback? onClick,
      double? dHeight,
      double? dWidth}) {
    return InkWell(
      onTap: onClick,
      child: Container(
          width: dWidth,
          height: dHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: Colours.MAIN_COLOR, spreadRadius: Dimens.gap_dp10),
            ],
          ),
          child: Center(
            child: Text(
              strTitle!,
              textAlign: TextAlign.center,
              style: TextStyles.textBold16White,
            ),
          )),
    );
  }
}
