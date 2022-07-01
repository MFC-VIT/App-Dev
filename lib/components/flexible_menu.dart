import 'package:flutter/material.dart';
import 'package:foodieland/components/custom_chips.dart';

class FlexibleMenu extends StatelessWidget {
  final double appBarHeight = 66.0;
  FlexibleMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight + appBarHeight),
      height: statusBarHeight + appBarHeight,
      decoration: const BoxDecoration(
        color: Color(0xfffe3c00),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.send,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Food',
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
            child: CustomChips(),
          ),
        ],
      ),
    );
  }
}
