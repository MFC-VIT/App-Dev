import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/components/author.dart';
import 'package:foodieland/screens/items_page.dart';
import 'package:lottie/lottie.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool isFirstTime;
  final SharedPreferences prefs;
  static const boolKey = 'isFirstTime';
  const SplashScreen({
    Key? key,
    required this.isFirstTime,
    required this.prefs,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _noodleController;
  bool copAnimated = false;
  bool animateAppName = false;

  @override
  void initState() {
    super.initState();
    _noodleController = AnimationController(vsync: this);
    _noodleController.addListener(() {
      if (_noodleController.value > 0.7) {
        _noodleController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 700), () {
          animateAppName = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _noodleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 42, 70),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Lottie.asset(
                    'assets/animations/splashAnimation.json',
                    controller: _noodleController,
                    onLoaded: (composition) {
                      _noodleController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                  Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Horizon',
                      ),
                      child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          animatedTexts: <AnimatedText>[
                            RotateAnimatedText(
                              "FOODIELAND",
                              duration: const Duration(
                                seconds: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          onFinished: () {
                            Navigator.of(context).pushReplacement<void, void>(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                if (widget.isFirstTime) {
                                  return IntroScreen(
                                      prefs: widget.prefs,
                                      boolKey: SplashScreen.boolKey);
                                } else {
                                  return const ItemsPage();
                                }
                              }),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
              opacity: animateAppName ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Visibility(visible: copAnimated, child: const Author())),
        ],
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  final SharedPreferences prefs;
  final String boolKey;
  const IntroScreen({Key? key, required this.prefs, required this.boolKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    prefs.setBool(boolKey, false);
    return const OnBoardingPage();
  }
}
