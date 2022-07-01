import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemCard extends StatelessWidget {
  Widget Rating(int num) {
    return Container(
        child: Row(
            children: List<Widget>.generate(5, (index) {
      return Icon(
        Icons.star,
        color: index < num ? Colors.amber : Colors.grey,
      );
    })));
  }

  final Item item;
  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Stack(alignment: Alignment.bottomRight, children: [
        Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item.imageUrl,
                  height: 125,
                  fit: BoxFit.cover,
                  width: 135,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Rating(item.rating),
                        Text(
                          '\$${item.price.round()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 254, 144, 0),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
        Ink(
          child: InkWell(
            customBorder: const CircleBorder(),
            child: const Icon(
              Icons.add_box_rounded,
              size: 50,
              color: Color.fromARGB(255, 254, 144, 0),
            ),
            onTap: () {
              print('Add Item');
            },
          ),
        ),
      ]),
    );
  }
}
