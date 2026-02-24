class HistoricalCharacterWarModel {
  String? id;
  String? name;
  String? image;
  String? description;

  HistoricalCharacterWarModel({this.id, this.name, this.image, this.description});

  factory HistoricalCharacterWarModel.fromTo(Map<String, dynamic> json) => HistoricalCharacterWarModel(
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
