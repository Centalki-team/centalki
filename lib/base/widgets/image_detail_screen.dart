import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../define/colors.dart';
import 'common_text_widgets/copyable_text.dart';

class ImageDetailScreen extends StatefulWidget {
  const ImageDetailScreen({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  final _transformationController = TransformationController();
  late TapDownDetails _doubleTapDetails;
  double scale = 1.0;
  var canbeScale = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Chi tiết hình ảnh'),
        ),
        body: GestureDetector(
          onDoubleTap: _handleDoubleTap,
          onDoubleTapDown: _handleDoubleTapDown,
          onVerticalDragEnd: (endDetails) {
            var velocity = endDetails.primaryVelocity ?? 0;
            if (velocity > 0) {
              Navigator.of(context, rootNavigator: false).pop();
            }
          },
          onTap: () {
            _transformationController.value = Matrix4.identity();
          },
          child: InteractiveViewer(
            scaleEnabled: canbeScale,
            transformationController: _transformationController,
            onInteractionUpdate: (ScaleUpdateDetails details) {
              scale = details.scale;
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                imageUrl: widget.image,
                errorWidget: (context, url, error) {
                  canbeScale = false;
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Không tải được hình ảnh với đường dẫn:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CopyableText(
                          label: widget.image,
                          copyColor: Colors.white,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
}
