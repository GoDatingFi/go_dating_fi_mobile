import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';

import '../widgets/utils/assets_utils.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 0.95.sw,
                      child: Image.asset(AssetsUtils.BACKGROUND_WALLET,
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 32.w,
                          height: 32.h,
                          child: Image.asset(AssetsUtils.MATIC,
                              fit: BoxFit.fitWidth),
                        ),
                        Text(
                          "1.234.342 MATIC",
                          style: TextStyles.textSize24S,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ListView.separated(
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      // isThreeLine: widget.summary != null,
                      leading: Container(
                        width: 20.w,
                        height: 20.h,
                        child: Image.asset(AssetsUtils.MATIC),
                      ),
                      title: Text(
                        "0.4246 GDF",
                        style: TextStyles.textBold18T,
                      ),
                      subtitle: Text(
                        "98.22 USD",
                        style: TextStyles.text16R,
                      ),
                      onTap: () {});
                },
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 0.05.sw),
                child: Text(
                  "Card list connect Metamask",
                  style: TextStyles.text16R,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Center(
                child: SizedBox(
                  width: 0.95.sw,
                  child: ListView.separated(
                    reverse: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child:
                        Image.asset(AssetsUtils.CARD_IMAGE, fit: BoxFit.fill),
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
