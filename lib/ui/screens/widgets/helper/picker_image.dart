import 'package:assets_media/wechat_assets_picker.dart';
import 'package:flutter/material.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class PickMethod {
  const PickMethod({
    required this.method,
    this.onLongPress,
  });

  factory PickMethod.common(int maxAssetsCount) {
    return PickMethod(
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

  factory PickMethod.cameraAndStay({required int maxAssetsCount}) {
    return PickMethod(
      method: (BuildContext context, List<AssetEntity> assets) {
        const AssetPickerTextDelegate textDelegate = AssetPickerTextDelegate();
        return AssetPicker.pickAssets(
          context,
          pickerConfig: AssetPickerConfig(
            maxAssets: maxAssetsCount,
            selectedAssets: assets,
            requestType: RequestType.common,
            specialItemPosition: SpecialItemPosition.prepend,
            specialItemBuilder: (
              BuildContext context,
              AssetPathEntity? path,
              int length,
            ) {
              if (path?.isAll != true) {
                return null;
              }
              return Semantics(
                label: textDelegate.sActionUseCameraHint,
                button: true,
                onTapHint: textDelegate.sActionUseCameraHint,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final AssetEntity? result = await _pickFromCamera(context);
                    if (result == null) {
                      return;
                    }
                    final AssetPicker<AssetEntity, AssetPathEntity> picker =
                        context.findAncestorWidgetOfExactType()!;
                    final DefaultAssetPickerBuilderDelegate builder =
                        picker.builder as DefaultAssetPickerBuilderDelegate;
                    final DefaultAssetPickerProvider p = builder.provider;
                    p.currentPath =
                        await p.currentPath!.obtainForNewProperties();
                    await p.switchPath(p.currentPath!);
                    p.selectAsset(result);
                  },
                  child: const Center(
                    child: Icon(Icons.camera_alt_outlined, size: 42.0),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  /// The core function that defines how to use the picker.
  final Future<List<AssetEntity>?> Function(
    BuildContext context,
    List<AssetEntity> selectedAssets,
  ) method;

  final GestureLongPressCallback? onLongPress;
}

Future<AssetEntity?> _pickFromCamera(BuildContext c) {
  return CameraPicker.pickFromCamera(
    c,
    pickerConfig: const CameraPickerConfig(enableRecording: true),
  );
}
