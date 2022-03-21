// import 'package:json_annotation/json_annotation.dart';


// @JsonSerializable()
class Product {
  Product({
    required this.id,
    required this.title,
    this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  late int id;
  late  String title;
  late dynamic price;
  late String description;
  late String category;
  late String image;
  late Rating rating;

  // factory Product.fromJson(Map<String, dynamic> json) =>
  //     _$ProductFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$ProductToJson(this);
}

// @JsonSerializable()
class Rating {
  dynamic rate;
  int? count;

  Rating({this.rate, this.count});

  // factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$RatingToJson(this);
}
