class SouvenirModel {
  final String id;
  final String name;
  final String image;
  // final String? description;
  // final String? price;

  SouvenirModel({
  required  this.id,
  required  this.name,
  required  this.image,
    // this.description,
    // this.price
  });

  factory SouvenirModel.fromQuerySnapshot(Map<String, dynamic> json) => SouvenirModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        // description: json['description'],
        // price: json['price']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        // 'description': description,
        // 'price': price
      };
}