import 'package:lottie/lottie.dart';

import '/screens/items_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Your Personal Chef',
              body: 'Choose the dish you want to eat',
              image: buildImage('assets/animations/foodChoice.json'),
              decoration: getPageDecoration(context),
            ),
            PageViewModel(
              title: 'Easy to use',
              body: 'Order from your own place.',
              image: buildImage('assets/animations/couchOrder.json'),
              decoration: getPageDecoration(context),
              footer: ButtonWidget(
                text: 'Start Ordering',
                onClicked: () => goToHome(context),
              ),
            ),
          ],
          done: const Text('Continue',
              style: TextStyle(color: Colors.orange, fontSize: 16)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text('Skip',
              style: TextStyle(color: Colors.orange, fontSize: 16)),
          onSkip: () => goToHome(context),
          next: Icon(
              color: Color.fromARGB(255, 175, 129, 76), Icons.arrow_forward),
          dotsDecorator: getDotDecoration(context),
          onChange: (index) {},
          globalBackgroundColor: const Color.fromARGB(255, 8, 42, 70),
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ItemsPage()),
      );

  Widget buildImage(String path) =>
      Center(child: Lottie.asset(path, width: 350));

  DotsDecorator getDotDecoration(context) => DotsDecorator(
        color: Colors.orange,
        activeColor: Colors.orangeAccent,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration(context) => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 20),
        bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Color(0xfffe3c00),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          primary: Colors.orange, // background
          onPrimary: Colors.white, // foreground
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            text,
          ),
        ),
      );
}
