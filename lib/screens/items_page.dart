import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/api/foodieland_service.dart';
import 'package:foodieland/components/custom_chips.dart';
import 'package:foodieland/components/flexible_menu.dart';
import 'package:foodieland/components/item_card.dart';
import 'package:foodieland/components/item_list.dart';
import 'package:foodieland/models/item.dart';

import '../components/author_card.dart';
import 'test.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late Widget list = Container();
  @override
  void initState() {
    super.initState();
    _viewAll();
  }

  void _viewAll() {
    list = FutureBuilder(
        future: FoodieLandService.getItems(),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ItemList(items: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xfffe3c00),
          pinned: true,
          floating: false,
          snap: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.25,
          leading: Container(
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
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => DummyScreen(
                            title: 'Account Page',
                            page: AuthorCard(
                              authorName: 'Manish Goyal',
                              title: 'Core Committee Member',
                              imageProvider:
                                  AssetImage('assets/images/githubPic.jpg'),
                            ))),
                  );
                },
              ),
            ),
          ),
          actions: [
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
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              DummyScreen(title: 'Shopping Page')),
                    );
                  },
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'FoodieLand',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Horizon', fontSize: 20.0),
          ),
          flexibleSpace: FlexibleSpaceBar(background: FlexibleMenu()),
          //     FlexibleSpaceBar(
          //   background: Image.asset(
          //     'assets/images/food.jpg',
          //     width: MediaQuery.of(context).size.width,
          //     fit: BoxFit.fitWidth,
          //   ),
          // ),
        ),
        SliverFillRemaining(
          child: list,
        ),
      ],
    ));
  }
}
