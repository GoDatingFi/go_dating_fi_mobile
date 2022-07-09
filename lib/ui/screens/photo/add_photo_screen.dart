import 'dart:io';

import 'package:assets_media/wechat_assets_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/app_bar_common.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/helper/picker_image.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';

import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/common.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  late List<AssetEntity>? assets = <AssetEntity>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBarCommon(context, strName: Languages.of(context)!.addPhotos),
        body: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20.sm, left: 10.sm, right: 10.sm),
                padding: EdgeInsets.only(bottom: 20.sm),
                child: GridView(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 0.5.sw,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    children: _listImage())),
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
        ));
  }

  _listImage() {
    if (assets != null && assets!.isNotEmpty) {
      return List<Widget>.generate(
          assets!.length,
          (j) => AspectRatio(
              aspectRatio: 1,
              child: FutureBuilder(
                future: assets![j].file,
                builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
                  return InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        snapshot.data!,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    onTap: () async {
                      assets = await PickMethod.cameraAndStay(maxAssetsCount: 6)
                          .method(context, assets!);
                      setState(() {
                        assets;
                      });
                    },
                  );
                },
              )));
    } else {
      return [
        InkWell(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    AssetsUtils.BACKGROUND_PHOTOS,
                    fit: BoxFit.cover,
                  )),
              Center(
                child: Image.asset(AssetsUtils.ADD_PHOTOS),
              ),
            ],
          ),
          onTap: () async {
            assets = await PickMethod.cameraAndStay(maxAssetsCount: 6)
                .method(context, assets!);
            setState(() {
              assets;
            });
          },
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsUtils.BACKGROUND_PHOTOS,
                  fit: BoxFit.cover,
                )),
            Center(
              child: Image.asset(AssetsUtils.ITEM_PHOTOS),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsUtils.BACKGROUND_PHOTOS,
                  fit: BoxFit.cover,
                )),
            Center(
              child: Image.asset(AssetsUtils.ITEM_PHOTOS),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsUtils.BACKGROUND_PHOTOS,
                  fit: BoxFit.cover,
                )),
            Center(
              child: Image.asset(AssetsUtils.ITEM_PHOTOS),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsUtils.BACKGROUND_PHOTOS,
                  fit: BoxFit.cover,
                )),
            Center(
              child: Image.asset(AssetsUtils.ITEM_PHOTOS),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  AssetsUtils.BACKGROUND_PHOTOS,
                  fit: BoxFit.cover,
                )),
            Center(
              child: Image.asset(AssetsUtils.ITEM_PHOTOS),
            ),
          ],
        ),
      ];
    }
  }
}
