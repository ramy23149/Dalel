class WarModel {
  String id;
  String name;
  String image;
  String description;

  WarModel({required this.id, required this.name, required this.image, required this.description});

  factory WarModel.fromJson(Map<String, dynamic> json) => WarModel(
        id: json['id'] as String,
        name: json['name'] as String,
        image: json['image'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
      };
}
