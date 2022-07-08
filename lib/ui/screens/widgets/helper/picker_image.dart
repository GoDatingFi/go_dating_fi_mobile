import 'package:assets_media/wechat_assets_picker.dart';
import 'package:flutter/cupertino.dart';

class PickMethod {
  const PickMethod({
    required this.icon,
    required this.name,
    required this.description,
    required this.method,
    this.onLongPress,
  });

  factory PickMethod.common(int maxAssetsCount) {
    return PickMethod(
      icon: '📹',
      name: 'Common picker',
      description: 'Pick images and videos.',
      method: (BuildContext context, List<AssetEntity> assets) {
        return AssetPicker.pickAssets(
          context,
          pickerConfig: AssetPickerConfig(
            maxAssets: maxAssetsCount,
            selectedAssets: assets,
            requestType: RequestType.common,
          ),
        );
      },
    );
  }

  final String icon;
  final String name;
  final String description;

  /// The core function that defines how to use the picker.
  final Future<List<AssetEntity>?> Function(
      BuildContext context,
      List<AssetEntity> selectedAssets,
      ) method;

  final GestureLongPressCallback? onLongPress;

}
