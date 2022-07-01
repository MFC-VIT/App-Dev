import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodieland/models/item.dart';

class FoodieLandService {
  static Future<List<Item>> getItems() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/data/items.json');

    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['items'] != null) {
      print('Not null');
      final recipes = <Item>[];
      json['items'].forEach((v) {
        recipes.add(Item.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  static Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
