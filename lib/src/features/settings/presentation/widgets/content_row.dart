import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

class ContentRow extends StatelessWidget {
  const ContentRow({
    super.key,
    required this.icon,
    required this.title,
    this.onClick,
  });

  final SvgGenImage icon;
  final String title;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              icon.svg(
                width: 24.0,
                height: 24.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
}
