import 'package:flutter/material.dart';

import '../models/item.dart';

class CustomChips extends StatefulWidget {
  CustomChips({Key? key}) : super(key: key);

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  final List<String> filters = <String>['All', 'Pizza', 'Drinks', 'Dessert'];
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        4,
        (int index) {
          return ChoiceChip(
            shape: StadiumBorder(),
            backgroundColor: _value == index
                ? Colors.white
                : Color.fromARGB(0, 126, 141, 148),
            label: Text(
              filters[index],
            ),
            selected: _value == index,
            labelStyle: TextStyle(
                color:
                    _value == index ? const Color(0xfffe3c00) : Colors.black),
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
