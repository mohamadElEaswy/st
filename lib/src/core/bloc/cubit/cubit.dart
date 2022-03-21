// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/end_points/end_points.dart';
import 'package:st/src/core/model/serialize_model.dart';
import 'package:st/src/services/remote/http_helper.dart';

import '../../assets/assets.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  HttpHelper httpInstance = HttpHelper();
// this function work automatically while the app start
//   Future fetch() async {
    // getHomeProducts();
    // getHomeCategories();
  // }

  // bool productsLoading = true;
  // List productsList = [];


  // Future getHomeProducts() async {
  //   emit(LoadingAppState());
  //   try {
  //     Response productsResponse =
  //         await httpInstance.getResponse(url: EndPoints.allProducts);
  //     if (productsResponse.statusCode == 200) {
  //       productsList = await json
  //           .decode(productsResponse.body)
  //           .map((i) => Product.fromJson(i))
  //           .toList();
  //       productsLoading = false;
  //       emit(SuccessAppState());
  //     } else {
  //       print(productsResponse.statusCode);
  //       productsLoading = false;
  //       emit(ErrorAppState(error: productsResponse.statusCode.toString()));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     productsLoading = false;
  //     emit(ErrorAppState(error: e.toString()));
  //   }
  //   return null;
  // }

  bool categoriesLoading = true;
  List categoriesList = [];
  Future getHomeCategories() async {
    emit(LoadingCategoriesState());
    try {
      Response categoriesResponse =
          await httpInstance.getResponse(url: EndPoints.allCategories);
      if (categoriesResponse.statusCode == 200) {
        categoriesList = await json.decode(categoriesResponse.body).toList();
        // productsLoading = false;
        emit(SuccessCategoriesState());
      } else {
        print(categoriesResponse.statusCode);
        // productsLoading = false;
        emit(ErrorCategoriesState(
            error: categoriesResponse.statusCode.toString()));
      }
    } catch (e) {
      print(e.toString());
      // productsLoading = false;
      emit(ErrorCategoriesState(error: e.toString()));
    }
    return null;
  }

  //get single product
  Product? singleProduct;
  bool singleProductLoading = true;
  // Future<Product?> getSingleProduct({required int productNumber}) async {
  //   singleProductLoading = true;
  //   emit(LoadingProductState());
  //
  //   try {
  //     Response singleProductResponse = await httpInstance.getResponse(
  //         url: EndPoints.singleProduct(productNumber));
  //     if (singleProductResponse.statusCode == 200) {
  //       singleProduct = Product.fromJson(
  //         json.decode(singleProductResponse.body),
  //       );
  //
  //       singleProductLoading = false;
  //       emit(SuccessProductState());
  //     } else {
  //       print(singleProductResponse.statusCode);
  //       singleProductLoading = false;
  //       emit(
  //         ErrorProductState(error: singleProductResponse.statusCode.toString()),
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     singleProductLoading = false;
  //     emit(
  //       ErrorProductState(error: e.toString()),
  //     );
  //   }
  //   return null;
  // }


  Product product = Product(
    id: 1,
    title: 'title',
    price: 'price',
    category: 'description',
    description: 'category',
    image: AppAssets.productImage,
    rating: Rating(
      count: 1,
      rate: 1,
    ),
  );
  List<Product> testProductList= [

  ];
}
