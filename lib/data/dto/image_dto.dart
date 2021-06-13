class ImagePathDTO {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String medium;
  String large;

  ImagePathDTO(
      {this.raw,
      this.full,
      this.regular,
      this.small,
      this.thumb,
      this.medium,
      this.large});

  factory ImagePathDTO.fromJson(dynamic json) {
    return ImagePathDTO(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );
  }

  @override
  String toString() {
    return 'ImagePathDTO{raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb, medium: $medium, large: $large}';
  }
}
