import 'package:flutter/material.dart';
import 'package:flutter_testing/color_button.dart';
import 'package:flutter_testing/configuration_widget.dart';
import 'package:flutter_testing/red_circle.dart';

class Home extends StatefulWidget {
  var colorIndex = 0;

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final baseUrl = ConfigurationWidget.of(context).configuration.baseUrl;
    print("baseUrl : $baseUrl");

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = constraints.maxHeight;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.accents.elementAt(
                            (widget.colorIndex + 5) % Colors.accents.length),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.maxFinite,
                        color: Colors.accents.elementAt(
                            (widget.colorIndex + 3) % Colors.accents.length),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 10,
                            runSpacing: 5,
                            children:
                                List.generate(20, (index) => const RedCircle()),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ColorButton(
                                onTap: () {
                                  setState(() {
                                    widget.colorIndex += 1;
                                  });
                                },
                                spam: true),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                color: Colors.accents.elementAt(
                                    (widget.colorIndex + 2) %
                                        Colors.accents.length)),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor:
          Colors.accents.elementAt(widget.colorIndex % Colors.accents.length),
    );
    ;
  }
}
