import 'dart:ui';

import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/common_txt_style.dart';
import '../common_assets.dart';

class BottomIndicatorBar extends StatefulWidget {
  final Color? activeColor;
  final Color? inactiveColor;
  final bool shadow;
  int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomIndicatorNavigationBarItem> items;

  BottomIndicatorBar({
    Key? key,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor = const Color(0xFFB0DFFF),
    this.shadow = true,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State createState() => _BottomIndicatorBarState();
}

class _BottomIndicatorBarState extends State<BottomIndicatorBar> {
  static const double BAR_HEIGHT = 72;
  static const double INDICATOR_HEIGHT = 8;

  List<BottomIndicatorNavigationBarItem> get items => widget.items;

  double width = 0;
  Duration duration = const Duration(milliseconds: 170);

  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Container(
      height: BAR_HEIGHT + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.mainColor1Surface,
        // boxShadow: widget.shadow
        //     ? [
        //         const BoxShadow(color: Colors.black12, blurRadius: 10),
        //       ]
        //     : null,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () {
                    _select(index, item);
                  },
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   width: width,
          //   child: AnimatedAlign(
          //     alignment:
          //         Alignment(_getIndicatorPosition(widget.currentIndex)!, 0),
          //     curve: Curves.linear,
          //     duration: duration,
          //     child: Container(
          //       color: widget.activeColor ?? const Color(0xff0050B3),
          //       width: width / items.length,
          //       height: INDICATOR_HEIGHT,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  _select(int index, BottomIndicatorNavigationBarItem item) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);
    setState(() {});
  }

  Widget _setIcon(BottomIndicatorNavigationBarItem item, bool isSelect) =>
      Column(
        children: [
          Container(
            height: 32.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: isSelect ? AppColor.mainColor2Surface : null,
            ),
            child: AssetCommon(
              name: item.iconName,
              // color: isSelect
              //     ? widget.activeColor ?? const Color(0xff0050B3)
              //     : widget.inactiveColor,
              color: AppColor.defaultFont,
              size: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          FittedBox(
            child: Text(
              item.title,
              style: CommonTxtStyle.t20Regular.apply(
                // color: isSelect

                //     ? widget.activeColor ?? const Color(0xff0050B3)
                //     : widget.inactiveColor,),
                color: AppColor.defaultFont,
              ),
              // maxLines: 1,
            ),
          )
        ],
      );

  Widget _buildItemWidget(
          BottomIndicatorNavigationBarItem item, bool isSelected) =>
      Container(
        color: item.backgroundColor,
        height: BAR_HEIGHT,
        width: width / items.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _setIcon(item, isSelected),
          ],
        ),
      );
}

class BottomIndicatorNavigationBarItem {
  final String iconName;
  final String title;
  final Color backgroundColor;
  //final Function() onTap;

  BottomIndicatorNavigationBarItem({
    required this.title,
    required this.iconName,
    this.backgroundColor = AppColor.mainColor1Surface,
    //required this.onTap,
  });
}
