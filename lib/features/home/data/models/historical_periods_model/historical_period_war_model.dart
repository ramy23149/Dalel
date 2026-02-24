class HistoricalPeriodWarModel {
  String? id;
  String? name;
  String? image;
  String? description;

  HistoricalPeriodWarModel({this.id, this.name, this.image, this.description});

  factory HistoricalPeriodWarModel.fromFrom(Map<String, dynamic> json) => HistoricalPeriodWarModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toFrom() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
      };
}
