import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/states/swap_lang.dart';

class RotateSwapButton extends StatefulWidget {
  final Widget childWidget;
  const RotateSwapButton({super.key, required this.childWidget});

  @override
  State<RotateSwapButton> createState() => _RotateSwapButtonState();
}

class _RotateSwapButtonState extends State<RotateSwapButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation =
        Tween<double>(begin: 0, end: pi).animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.stop();
            }
          });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var swap = Provider.of<Swap>(context, listen: false);

    return Transform.rotate(
      angle: animation.value,
      origin: const Offset(.2, .2),
      child: GestureDetector(
        onTap: () {
          animationController.reset();
          animationController.forward();
          debugPrint("Clicked!");
          swap.setTouchState();
          debugPrint("${swap.touchState}");
        },
        child: widget.childWidget,
      ),
    );
  }
}
