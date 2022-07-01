import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  late Widget? page;
  late String title;
  DummyScreen({Key? key, this.page, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: <AnimatedText>[
                  TyperAnimatedText(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            page ?? Container(),
          ],
        ),
      ),
    );
    //   DefaultTextStyle(
    //     style: const TextStyle(
    //       fontSize: 40.0,
    //       fontFamily: 'Horizon',
    //     ),
    //     child: AnimatedTextKit(
    //         animatedTexts: <AnimatedText>[
    //           RotateAnimatedText(
    //             "FOODIELAND",
    //             duration: const Duration(
    //               seconds: 1,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //         ],
    //         onFinished: () {
    //           Navigator.of(context).pushReplacement<void, void>(
    //             MaterialPageRoute<void>(
    //               builder: (BuildContext context) => const DummyScreen(),
    //             ),
    //           );
    //         }),
    //   );
    // }
  }
}
