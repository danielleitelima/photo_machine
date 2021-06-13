import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_machine/logic/bloc/gallery_bloc.dart';
import 'package:photo_machine/logic/bloc/gallery_state.dart';
import 'package:photo_machine/presentation/widget/photo_list.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final galleryBloc = BlocProvider.of<GalleryBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.refresh),
              onPressed: () => galleryBloc.add(GalleryEvent.refresh),
            )
          ],
        ),
        body: BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
          if (state is GalleryStateLoading)
            return Center(
                child: Shimmer.fromColors(
                    baseColor: Colors.green[400],
                    highlightColor: Colors.green,
                    child: Text(
                      'Loading',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    // CircularProgressIndicator(),
                    ));
          if (state is GalleryStateLoaded)
            return PhotoList(
              photoList: state.photoList,
            );
          if (state is GalleryStateError) return Center(child: Text(state.message));
          return Center(
            child: Text("Empty List"),
          );
        }));
  }
}
