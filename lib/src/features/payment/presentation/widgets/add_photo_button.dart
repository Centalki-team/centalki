import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/helpers/upload-file.dart';
import '../../domain/entities/image_with_size_entity.dart';
import 'camera_image_picker_bottom_sheet.dart';
import 'removable_picture.dart';

class AddPhotoButton extends StatefulWidget {
  const AddPhotoButton({
    super.key,
    this.initValue,
    required this.onTap,
  });

  final XFile? initValue;
  final Function(XFile?) onTap;

  @override
  State<AddPhotoButton> createState() => _AddPhotoButtonState();
}

class _AddPhotoButtonState extends State<AddPhotoButton> {
  XFile? curValue;

  @override
  void initState() {
    super.initState();
    curValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) => curValue == null
      ? GestureDetector(
          onTap: () async {
            final image = await imagePickerPopUp(context);
            if (image != null) {
              // TODO: Nhờ idol dev tiếp
              final url = await uploadFile(image);
              widget.onTap.call(image);
              setState(() {
                curValue = image;
              });
            }
          },
          child: Container(
            width: 88.0,
            height: 88.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  color: Color(0xFF9D9DAD),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: AppColor.mainColor2,
              ),
            ),
          ),
        )
      : RemovablePicture(
          imagePath: curValue!.path,
          onRemove: () {
            setState(
              () => curValue = null,
            );
            widget.onTap(curValue);
          },
        );

  Future<XFile?> imagePickerPopUp(BuildContext context) async {
    final selectedImage = await showDialog<XFile>(
      context: context,
      builder: (context) => CameraAndImagePickerPopUp(
        takeAPictureButtonAction: () async {
          // final result = await Modular.to
          //     .pushNamed(CameraRoute.root.camera.fullRoute, arguments: 7);
          // if (result != null) {
          //   if ((result as List<ImageWithSizeEntity>).isNotEmpty) {
          //     for (var e in result) {
          //       print('========> e: ${e.fileSize}');
          //     }
          //   }
          // }
          final image =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (!mounted) return;
          Navigator.of(context).pop(image);
        },
        imagePickerAction: (image) => Navigator.of(context).pop(image),
      ),
    );
    return selectedImage;
  }
}
