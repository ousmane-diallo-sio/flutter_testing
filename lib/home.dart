import 'package:flutter/material.dart';
import 'package:flutter_testing/color_button.dart';

class Home extends StatefulWidget {
  var colorIndex = 0;

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              child: ColorButton(
                onTap: () {
                  setState(() {
                    widget.colorIndex += 1;
                  });
                },
                spam: true
            ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.accents.elementAt(widget.colorIndex % Colors.accents.length),
    );
    ;
  }
}
