import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/service.dart';
import 'package:whatsapp/top/topAppBar.dart';
import 'package:whatsapp/top/topSearchBar.dart';

class TopStack extends StatefulWidget {
  @override
  _TopStackState createState() => _TopStackState();
}

class _TopStackState extends State<TopStack> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final service = Service();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    service.searchOpen.addListener(listener);
    super.initState();
  }

  void listener() {
    if (service.searchOpen.value) {
      _controller.forward(from: 0.0);
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    service.searchOpen.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopAppBar(),
        AnimatedBuilder(
          animation: _controller,
          child: TopSearchBar(),
          builder: (context, child) {
            print(_controller.value);
            return ClipPath(
              clipper: MyClipper(_controller.value),
              child: child,
            );
          },
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final double value;

  MyClipper(this.value);
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(center: Offset(size.width-50, 20), radius: value * size.width));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
