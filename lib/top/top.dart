import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/service.dart';
import 'package:whatsapp/top/topStack.dart';

class Top extends StatelessWidget {
  final service = Service();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: service.tabController!.animation!,
      builder: (context, child) {
        bool isAnimatable = service.tabController!.animation!.value <= 1;
        return Positioned(
          left: 0,
          top: isAnimatable
              ? -(service.topAppBarHeight.value) * (1 - service.tabController!.animation!.value)
              : 0,
          child: TopStack(),
        );
      },
    );
  }
}
