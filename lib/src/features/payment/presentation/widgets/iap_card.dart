import 'package:flutter/material.dart';

import '../../../../../../base/define/styles.dart';

class IAPCard extends StatefulWidget {
  final String title;
  final String priceFormat;
  final Function onPress;
  final String description;
  const IAPCard(
      {Key? key,
      required this.title,
      required this.priceFormat,
      required this.onPress,
      required this.description})
      : super(key: key);

  @override
  State<IAPCard> createState() => _IAPCardState();
}

class _IAPCardState extends State<IAPCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          widget.onPress();
        },
        child: Container(
            margin: const EdgeInsets.all(spacing8),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadow.shade300,
                    spreadRadius: 0,
                    blurRadius: 4.0,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: ListTile(
                // leading: const Icon(Icons.list),
                subtitle: Text(
                  widget.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                  ),
                ),
                trailing: Text(
                  widget.priceFormat,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                  ),
                ),
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: AppColor.defaultFont,
                  ),
                ))),
      );
}
