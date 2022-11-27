import 'package:animated_drawer/home_screen.dart';
import 'package:flutter/material.dart';

double cardSize = 200;

class AnimatedDrawer extends StatefulWidget {
  const AnimatedDrawer({super.key});

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _toggleMenu() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
      return;
    }
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
        clipBehavior: Clip.hardEdge,
        delegate: FabVerticalDelegate(
          controller: animationController,
        ),
        children: [
          HomeScreen(menuAction: _toggleMenu),
          GestureDetector(
            onTap: _toggleMenu,
            child: SizedBox(
              width: cardSize,
              height: MediaQuery.of(context).size.height,
              child: const Scaffold(),
            ),
          )
        ]);
  }
}

class FabVerticalDelegate extends FlowDelegate {
  final Animation<double> controller;

  FabVerticalDelegate({required this.controller}) : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = cardSize * controller.value;
    var x2 = cardSize * controller.value + -cardSize;
    context.paintChild(0, transform: Matrix4.translationValues(x, 0, 0));
    context.paintChild(1, transform: Matrix4.translationValues(x2, 0, 0));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
