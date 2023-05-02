import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {

  final void Function() onTap;
  final bool? spam;

  ColorButton({Key? key, required this.onTap, this.spam}) : super(key: key);

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  late Timer timer;

  _startSpamming() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
      widget.onTap();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSpamming();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        if (widget.spam == true && !timer.isActive) {
          _startSpamming();
        }
      },
      onDoubleTap: () {
        timer.cancel();
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blueAccent,
      ),
    );
  }
}
