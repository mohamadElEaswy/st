import 'package:json_annotation/json_annotation.dart';

part 'serialize_model.g.dart';

@JsonSerializable()
class Product{
  Product(
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      );
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Rating rating;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson()=> _$ProductToJson(this);
}

@JsonSerializable()
class Rating {
  dynamic rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>_$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}


