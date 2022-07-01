import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:foodieland/components/item_card.dart';

import '../models/item.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  const ItemList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return ItemCard(item: items[index]);
        }));
  }
}
