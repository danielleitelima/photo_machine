import 'package:flutter/widgets.dart';
import 'package:photo_machine/data/model/photo.dart';

@immutable
abstract class GalleryState {}

class GalleryStateEmpty extends GalleryState {}

class GalleryStateLoading extends GalleryState {}

class GalleryStateLoaded extends GalleryState {
    final List<Photo> photoList;

  GalleryStateLoaded({this.photoList});
}

class GalleryStateError extends GalleryState {
    final String message;

  GalleryStateError(this.message);
}
