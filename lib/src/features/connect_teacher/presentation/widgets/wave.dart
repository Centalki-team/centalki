import 'package:flutter/material.dart';

class Wave extends StatefulWidget {
  const Wave({
    Key? key,
    required this.widthScreen,
    required this.heightScreen,
    required this.colors,
    required this.amount,
    required this.pick,
  }) : super(key: key);

  final double widthScreen;
  final double heightScreen;
  final List<Color> colors;
  final int amount;
  final double pick;

  @override
  State<Wave> createState() => _WaveState();
}

class _WaveState extends State<Wave> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

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
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Transform.translate(
        offset: Offset(animation.value * 10 * widget.widthScreen, 0),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: widget.heightScreen,
          width: -widget.widthScreen * 12,
          child: CustomPaint(
            painter: WavePainter(
              realSize: Size(
                -widget.widthScreen * 12,
                widget.heightScreen,
              ),
              colors: widget.colors,
              pick: widget.pick,
              amount: 12,
            ),
          ),
        ),
      );
}

class WavePainter extends CustomPainter {
  List<Color> colors;
  int amount;
  double pick;
  Size? realSize;

  WavePainter(
      {required this.colors, this.amount = 4, this.pick = 30, this.realSize});

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
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
