// Dummy Widget

import 'package:flutter/material.dart';

class ScrollTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          backgroundColor: Colors.black,
          leading:IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () => {},
            ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Example'),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 40,
          ),
        )
      ],
    );
  }
}
