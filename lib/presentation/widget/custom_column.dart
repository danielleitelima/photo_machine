import 'package:flutter/material.dart';

import 'badge_list.dart';

class CustomColumn extends StatelessWidget {
  CustomColumn({Key key, this.title}) : super(key: key);

  final String title;
  final imageURL =
      "https://images.unsplash.com/photo-1621801366361-466552e31034?ixid=MnwyMzg2NjJ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MjM0NzA4NzM\u0026ixlib=rb-1.2.1";
  final dummyStringList = ["First", "Second", "Third", "Fourth", "Fifth", "Sixth"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          setupImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () => {},
              ),
            ),
          )
        ]),
        Column(
          children: generateHeaders(8),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Title", style: TextStyle(fontSize: 28)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Description", style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }

  Image setupImage(BuildContext context) => Image.network(imageURL, loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : LinearProgressIndicator(
                value: loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes);
      });

  List<Widget> generateHeaders(int count) => List<Widget>.generate(
      count,
      (i) => BadgeList(
            backgroundColor: Colors.primaries.elementAt(i),
            itemList: dummyStringList,
          ));
}
