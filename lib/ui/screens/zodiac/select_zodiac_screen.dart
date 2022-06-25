import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/core/model/zodiac_item.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/app_bar_common.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/assets_utils.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/constants.dart';

import '../widgets/utils/common.dart';
import '../widgets/utils/text_style.dart';

class SelectZodiacScreen extends StatefulWidget {
  const SelectZodiacScreen({Key? key}) : super(key: key);

  @override
  _SelectZodiacScreenState createState() => _SelectZodiacScreenState();
}

class _SelectZodiacScreenState extends State<SelectZodiacScreen> {
  int _position = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(context,
          strName: Languages.of(context)!.titleSelectZodiac),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.sm, bottom: 20.sm),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 3,
                  childAspectRatio: 7 / 9,
                ),
                itemCount: _listZodiacItem.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        InkWell(
                          child: CircleAvatar(
                            backgroundColor: _position == index
                                ? Colours.MAIN_COLOR
                                : Colors.transparent,
                            radius: 58.sm,
                            child: SvgPicture.asset(
                              _listZodiacItem[index].strAssets!,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _position = index;
                            });
                          },
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          _listZodiacItem[index].strName!,
                          style: TextStyles.textBold14,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          _listZodiacItem[index].strDate!,
                          style: TextStyles.textBold12RText,
                        )
                      ],
                    ),
                  );
                }),
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
    );
  }

  List<ZodiacItem> get _listZodiacItem => [
        ZodiacItem(AssetsUtils.ARIES_ICON, Languages.of(context)!.textAries,
            Constants.ARIES_DATE),
        ZodiacItem(AssetsUtils.TAURUS_ICON, Languages.of(context)!.textTaurus,
            Constants.TAURUS_DATE),
        ZodiacItem(AssetsUtils.GEMINI_ICON, Languages.of(context)!.textGemini,
            Constants.GEMINI_DATE),
        ZodiacItem(AssetsUtils.CANCER_ICON, Languages.of(context)!.textCancer,
            Constants.CANCER_DATE),
        ZodiacItem(AssetsUtils.LEO_ICON, Languages.of(context)!.textLeo,
            Constants.LEO_DATE),
        ZodiacItem(AssetsUtils.VIRGO_ICON, Languages.of(context)!.textVirgo,
            Constants.VIRGO_DATE),
        ZodiacItem(AssetsUtils.LIBRA_ICON, Languages.of(context)!.textLibra,
            Constants.LIBRA_DATE),
        ZodiacItem(AssetsUtils.SCORPIO_ICON, Languages.of(context)!.textScorpio,
            Constants.SCORPIO_DATE),
        ZodiacItem(AssetsUtils.SAGITTARIUS_ICON,
            Languages.of(context)!.textSagittarius, Constants.SAGITTARIUS_DATE),
        ZodiacItem(AssetsUtils.CAPRICORNUS_ICON,
            Languages.of(context)!.textCapricorus, Constants.CAPRICORNUS_DATE),
        ZodiacItem(AssetsUtils.AQUARIUS_ICON,
            Languages.of(context)!.textAquarius, Constants.AQUARIUS_DATE),
        ZodiacItem(AssetsUtils.PISCES, Languages.of(context)!.textPisces,
            Constants.PISCES_DATE),
      ];
}
