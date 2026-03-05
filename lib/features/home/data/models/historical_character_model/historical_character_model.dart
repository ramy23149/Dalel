import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';


class HistoricalCharacterModel {
	String id;
	String name;
	String? image;
	String? homeImage;
	String birthYear;
	String deathYear;
	String fullDescription;
	List<WarModel>? wars;

	HistoricalCharacterModel({
		required this.id, 
	required	this.name, 
		this.image, 
		this.homeImage, 
	required	this.birthYear, 
	required	this.deathYear, 
	required	this.fullDescription, 
		this.wars, 
	});

	factory HistoricalCharacterModel.fromQuerySnapshot(Map<String, dynamic> json) {
		return HistoricalCharacterModel(
			id: json['id'] as String,
			name: json['name'] as String,
			image: json['image'] as String?,
			homeImage: json['homeImage'] as String?,
			birthYear: json['birthYear'] as String,
			deathYear: json['deathYear'] as String,
			fullDescription: json['description'] as String,
			wars: (json['wars'] as List<dynamic>?)
						?.map((e) => WarModel.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toTo() => {
				'id': id,
				'name': name,
				'image': image,
				'homeImage': homeImage,
				'birthYear': birthYear,
				'deathYear': deathYear,
				'fullDescription': fullDescription,
				'wars': wars?.map((e) => e.toJson()).toList(),
			};
}
