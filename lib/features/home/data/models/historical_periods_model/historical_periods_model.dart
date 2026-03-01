import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';


class HistoricalPeriodsModel {
  String? id;
  String name;
  String? image;
  String description;
  List<WarModel> wars;

  HistoricalPeriodsModel({
    this.id,
    required this.name,
    this.image,
    required this.description,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromQuerySnapshot(Map<String, dynamic> json,List<WarModel> wars) {
    return HistoricalPeriodsModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      image: json['image'] as String?,
      description: json['description'] as String,
      wars: wars,
    );
  }

  Map<String, dynamic> toFrom() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'wars': wars.map((e) => e.toJson()).toList(),
      };
}
