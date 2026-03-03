class WarModel {
  String name;
  String image;
  String description;

  WarModel({ required this.name, required this.image, required this.description});

  factory WarModel.fromJson(Map<String, dynamic> json) => WarModel(
        name: json['name'] as String,
        image: json['image'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'description': description,
      };
}
