class EndPoints{
  static const String baseUrl ='https://fakestoreapi.com/';
  static const String allProducts ='https://fakestoreapi.com/products';
  static const String allCategories ='https://fakestoreapi.com/products/categories';

  static String singleProduct (int productNumber) =>'https://fakestoreapi.com/products/$productNumber';
}