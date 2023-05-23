import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';
// import '../../domain/entities/image_with_size_entity.dart';

class CameraAndImagePickerPopUp extends StatelessWidget {
  const CameraAndImagePickerPopUp({
    Key? key,
    this.takeAPictureButtonAction,
    this.imagePickerAction,
  }) : super(key: key);

  final Function()? takeAPictureButtonAction;
  final Function(XFile image)? imagePickerAction;

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
                      backgroundColor:
                          colorsByTheme(context).backgroundCardsChip,
                    ),
                    child: Text(
                      S.current.txtTakeAPic,
                      style: TextStyle(
                        fontSize: labelLargeSize,
                        fontWeight: labelLargeWeight,
                        height: 20 / 22,
                        color: colorsByTheme(context).defaultFont,
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
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          imagePickerAction?.call(image);
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            colorsByTheme(context).backgroundCardsChip,
                      ),
                      child: Text(
                        S.current.txtChooseFromLibrary,
                        style: TextStyle(
                          fontSize: labelLargeSize,
                          fontWeight: labelLargeWeight,
                          height: 20 / 22,
                          color: colorsByTheme(context).defaultFont,
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
