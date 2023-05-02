import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {
  final void Function() onTap;
  final double? width;
  final bool? spam;

  ColorButton({Key? key, required this.onTap, this.width, this.spam})
      : super(key: key);

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  Timer? timer;

  _handleSpamming() {
    print("ouai");
    if (timer == null || widget.spam == true && timer?.isActive == false) {
      timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
        widget.onTap();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _handleSpamming();
      },
      onDoubleTap: () {
        timer?.cancel();
      },
      child: Container(
        width: widget.width ?? 100,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text("Click me"),
        ),
      ),
    );
  }
}
