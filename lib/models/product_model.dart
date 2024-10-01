class ProductModel {
  final num id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;
  ProductModel( {required this.category,
    required this.rating,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(

      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
      category: json['category'],
    );
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
