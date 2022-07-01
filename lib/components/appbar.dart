import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double barHeight = 66.0;

  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: Ink(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: InkWell(
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                print('Accounts');
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'FoodieLand',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Horizon', fontSize: 20.0),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Ink(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: InkWell(
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  size: 25,
                  Icons.shopping_cart_outlined,
                ),
              ),
              onTap: () {
                print('Shopping');
              },
            ),
          ),
        ),
      ],
    );
  }
}
