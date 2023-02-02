import 'dart:async';

import 'package:centalki/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../../../base/define/dimensions.dart';

class ConnectTeacherView extends StatefulWidget {
  const ConnectTeacherView({Key? key}) : super(key: key);

  @override
  State<ConnectTeacherView> createState() => _FindTeacherViewState();
}

class _FindTeacherViewState extends State<ConnectTeacherView> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  bool _isLoading = true;
  bool _isLoadDone = false;

  _changeState() async {
    // setStates are bad but we do not have BLoC yet
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      _isLoading = false;
    });
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      _isLoadDone = true;
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6500),
    );
    final Animation<double> curve = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutSine,
      reverseCurve: Curves.easeInOutSine,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(curve);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(
      reverse: true,
      period: const Duration(milliseconds: 6500),
    );
    _changeState();
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = -MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      color: const Color(0xffFFD033),
      child: SizedBox(
        height: height,
        width: -width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(animation.value * 10 * width, 0),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: _isLoading
                      ? height * 1 / 3
                      : _isLoadDone
                          ? height
                          : height * 2 / 3,
                  width: -width * 12,
                  child: CustomPaint(
                    painter: WavePainter(
                      realSize: Size(
                          -width * 12,
                          _isLoading
                              ? height * 1 / 3
                              : _isLoadDone
                                  ? height
                                  : height * 2 / 3),
                      colors: _isLoading
                          ? [const Color(0xffFF8811)]
                          : _isLoadDone
                              ? [const Color(0xff55C885)]
                              : [const Color(0xff3AAFFF)],
                      pick: _isLoadDone ? 0 : 24,
                      amount: 12,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoadDone
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 48,
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      _isLoading
                          ? "Finding teacher for you..."
                          : _isLoadDone
                              ? "Connected to <teacher's name>\nLaunching session..."
                              : "Teacher found. Connecting...",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: height * 0.1,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Cancel connecting',
                        textAlign: TextAlign.center,
                      ),
                      content: const Text(
                        'Are you sure to cancel connecting to teacher?',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  side: const BorderSide(color: Colors.grey)
                                ),
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('No'),
                              ),
                            ),
                            const SizedBox(width: smallSpacing10),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue
                                ),
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Yes', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).then((value) => value ?? false);
                  if (result) {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Row(
                  children: const [
                    Icon(Icons.close_rounded, color: Colors.redAccent),
                    SizedBox(width: smallSpacing4),
                    Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  List<Color> colors;
  int amount;
  double pick;
  Size? realSize;

  WavePainter({required this.colors, this.amount = 4, this.pick = 30, this.realSize});

  @override
  void paint(Canvas canvas, Size size) {
    size = realSize ?? size;
    var paint = Paint()..color = colors.first;
    // In case we want to use gradient styles in the future
    // ..shader = LinearGradient(
    //   begin: Alignment.topCenter,
    //   end: Alignment.bottomCenter,
    //   colors: colors,
    // ).createShader(Rect.fromPoints(
    //   Offset.zero,
    //   Offset(size.width, size.height),
    // ));
    var ww = size.width / (amount * 2 - 1);
    var path = Path();
    var hh = true;

    // path.lineTo(0, 0);
    for (var i = 1; i <= (4 * amount - 2); i++) {
      if (i % 2 == 0) {
        path.lineTo(i * ww / 2, 0);
        path.lineTo(i * ww / 2, 0);
      } else {
        if (hh) {
          path.quadraticBezierTo(i * (ww / 2), pick, (i + 1) * ww / 2, 0);
          hh = false;
        } else {
          path.quadraticBezierTo(i * (ww / 2), -pick, (i + 1) * ww / 2, 0);
          hh = true;
        }
      }
    }
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
