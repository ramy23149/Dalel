import 'war.dart';

class HistoricalPeriodsModel {
  String? id;
  String? name;
  String? image;
  String? description;
  List<War>? wars;

  HistoricalPeriodsModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.wars,
  });

  factory HistoricalPeriodsModel.fromQuerySnapshot(Map<String, dynamic> json) {
    return HistoricalPeriodsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      wars: (json['wars'] as List<dynamic>?)
          ?.map((e) => War.fromFrom(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toFrom() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'wars': wars?.map((e) => e.toFrom()).toList(),
      };
}
