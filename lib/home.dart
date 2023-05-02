import 'package:flutter/material.dart';
import 'package:flutter_testing/color_button.dart';

class Home extends StatefulWidget {
  var colorIndex = 0;
  double? btnWidth;

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Home',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.btnWidth,
                child: ColorButton(
                    width: double.maxFinite,
                    onTap: () {
                      setState(() {
                        widget.colorIndex += 1;
                        widget.btnWidth = (widget.colorIndex * 100) % deviceWidth;
                      });
                    },
                    spam: true),
              ),
            ),
          ],
        ),
      ),
      backgroundColor:
          Colors.accents.elementAt(widget.colorIndex % Colors.accents.length),
    );
    ;
  }
}
