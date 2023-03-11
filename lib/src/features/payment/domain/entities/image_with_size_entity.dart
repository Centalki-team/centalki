import 'dart:io';

import 'package:equatable/equatable.dart';

class ImageWithSizeEntity extends Equatable {
  const ImageWithSizeEntity({required this.imgFile, required this.fileSize});

  final File imgFile;
  final double fileSize;

  bool get isFileSizeOver10MB => fileSize > 10;

  @override
  List<Object?> get props => [
        imgFile,
        fileSize,
      ];
}
