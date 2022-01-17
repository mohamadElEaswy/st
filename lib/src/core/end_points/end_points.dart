class EndPoints{
  static const String baseUrl ='https://fakestoreapi.com/';
  static const String allProducts ='https://fakestoreapi.com/products';
  static String product (int productNumber) =>'products?limit=$productNumber';
}