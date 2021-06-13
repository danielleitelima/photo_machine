import 'dart:typed_data';

import 'package:photo_machine/data/model/photographer.dart';

class Photo {
  String title;
  String description;
  int likeCount;
  int viewCount;
  int downloadCount;
  Uint8List content;
  Photographer photographer;

  Photo({this.title, this.description, this.likeCount, this.viewCount, this.downloadCount, this.content,
      this.photographer});
}
