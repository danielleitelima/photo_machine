import 'package:photo_machine/data/dto/user_dto.dart';

import 'image_dto.dart';

class PhotoDTO {
  String description;
  String altDescription;
  String timestamp;
  int views;
  int downloads;
  int likes;
  int width;
  int height;
  String color;
  UserDTO user;
  ImagePathDTO urls;

  PhotoDTO(
      {this.description,
      this.altDescription,
      this.timestamp,
      this.views,
      this.downloads,
      this.likes,
      this.width,
      this.height,
      this.color,
      this.user,
      this.urls});

  factory PhotoDTO.fromJson(dynamic json) {
    return PhotoDTO(
      description: json['description'] as String,
      altDescription: json['alt_description'] as String,
      timestamp: json['timestamp'] as String,
      views: json['views'] as int,
      downloads: json['downloads'] as int,
      likes: json['likes'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      user: UserDTO.fromJson(json['user']),
      urls: ImagePathDTO.fromJson(json['urls']),
    );
  }

  @override
  String toString() {
    return 'PhotoDTO{description: $description, altDescription: $altDescription, timestamp: $timestamp, views: $views, downloads: $downloads, likes: $likes, width: $width, height: $height, color: $color, user: $user, urls: $urls}';
  }
}
