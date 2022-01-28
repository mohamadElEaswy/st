import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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


Future<Product?> getData() async {
  const googleLocationsURL = 'https://fakestoreapi.com/products';

  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(googleLocationsURL));
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    }
  } catch (e) {
    print(e);
  }
  return null;

  // Fallback for when the above HTTP request fails.

}