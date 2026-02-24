import 'war.dart';

class HistoricalCharacter {
	String? id;
	String name;
	String? image;
	String? homeImage;
	String birthYear;
	String deathYear;
	String fullDescription;
	List<War>? wars;

	HistoricalCharacter({
		this.id, 
	required	this.name, 
		this.image, 
		this.homeImage, 
	required	this.birthYear, 
	required	this.deathYear, 
	required	this.fullDescription, 
		this.wars, 
	});

	factory HistoricalCharacter.fromQuerySnapshot(Map<String, dynamic> json) {
		return HistoricalCharacter(
			id: json['id'] as String?,
			name: json['name'] as String,
			image: json['image'] as String?,
			homeImage: json['homeImage'] as String?,
			birthYear: json['birthYear'] as String,
			deathYear: json['deathYear'] as String,
			fullDescription: json['fullDescription'] as String,
			wars: (json['wars'] as List<dynamic>?)
						?.map((e) => War.fromTo(e as Map<String, dynamic>))
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
				'wars': wars?.map((e) => e.toTo()).toList(),
			};
}
