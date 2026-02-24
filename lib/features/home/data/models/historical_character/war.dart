class War {
  String? id;
  String? name;
  String? image;
  String? description;

  War({this.id, this.name, this.image, this.description});

  factory War.fromTo(Map<String, dynamic> json) => War(
        id: json['id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toTo() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
      };
}
