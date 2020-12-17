import 'package:flutter/widgets.dart';

class HolePuncherPainter extends CustomPainter {
  static final clearPaint = new Paint();

  const HolePuncherPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        new Rect.fromLTWH(0.0, 0.0, size.width, size.height), clearPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Punches a hole through the canvas for the given [child].
class HolePuncher extends StatelessWidget {
  final Widget child;

  const HolePuncher({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: const HolePuncherPainter(),
      child: child,
      willChange: false,
    );
  }
}
