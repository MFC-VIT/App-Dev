import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  const Author({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/githubPic.jpg'),
              radius: 25,
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.copyright,
              color: Color.fromARGB(255, 173, 173, 173),
              size: 25,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              '@manisgoyal',
              textScaleFactor: 2.2,
              style: TextStyle(
                color: Color.fromARGB(255, 173, 173, 173),
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
