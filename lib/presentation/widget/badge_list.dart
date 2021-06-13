// Dummy Widget

import 'package:flutter/material.dart';

class BadgeList extends StatelessWidget {
  final List<String> itemList;
  final Color backgroundColor;

  BadgeList({@required this.itemList, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: backgroundColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Text(itemList.elementAt(index), style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
            );
          },
      ),
    );
  }
}
