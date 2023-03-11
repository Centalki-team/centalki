import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../domain/entities/image_with_size_entity.dart';

class CameraAndImagePickerPopUp extends StatelessWidget {
  const CameraAndImagePickerPopUp({
    Key? key,
    this.takeAPictureButtonAction,
    this.imagePickerAction,
  }) : super(key: key);

  final ImageWithSizeEntity Function()? takeAPictureButtonAction;
  final ImageWithSizeEntity Function(File image)? imagePickerAction;

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: spacing16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () async => takeAPictureButtonAction?.call(),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.white,
                    ),
                    child: const Text(
                      TextDoc.txtTakeAPic,
                      style: TextStyle(
                        fontSize: labelLargeSize,
                        fontWeight: labelLargeWeight,
                        height: 20 / 22,
                        color: AppColor.defaultFont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: spacing8,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: spacing16,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        // final image = await PickMultiImageController()
                        //     .getMultiImageFromGallery(imageCount: 7);
                        // imagePickerAction.call(image);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.white,
                      ),
                      child: const Text(
                        TextDoc.txtChooseFromLibrary,
                        style: TextStyle(
                          fontSize: labelLargeSize,
                          fontWeight: labelLargeWeight,
                          height: 20 / 22,
                          color: AppColor.defaultFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: spacing16,
            ),
          ],
        ),
      );
}
