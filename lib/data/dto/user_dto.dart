import 'package:photo_machine/data/dto/image_dto.dart';

class UserDTO {
  String name;
  ImagePathDTO profileImage;

  UserDTO(
      {this.name,
      this.profileImage});

  factory UserDTO.fromJson(dynamic json) {
    return UserDTO(
      name: json['name'] as String,
      profileImage: ImagePathDTO.fromJson(json['profile_image'])
    );
  }

  @override
  String toString() {
    return 'UserDTO{name: $name, profileImage: $profileImage}';
  }
}
