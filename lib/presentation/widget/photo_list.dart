import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_machine/data/model/photo.dart';
import 'package:photo_machine/logic/bloc/gallery_bloc.dart';

class PhotoList extends StatelessWidget {
  final List<Photo> photoList;

  const PhotoList({Key key, this.photoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final galleryBloc = BlocProvider.of<GalleryBloc>(context);

    final _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge && _controller.position.pixels != 0) {
        galleryBloc.add(GalleryEvent.loadMore);
      }
    });

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: photoList.length + 1,
      itemBuilder: (context, index) {
        if (index < photoList.length)
          return Padding(
            padding: const EdgeInsets.fromLTRB(8,8,8,0),
            child: Image.memory(photoList.elementAt(index).content),
          );
        return Padding(
          padding: const EdgeInsets.fromLTRB(0,40,0,40),
          child: Center(child: CircularProgressIndicator()),
        );
      },
      controller: _controller,
    );
  }
}
