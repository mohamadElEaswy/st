// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/end_points/end_points.dart';
import 'package:st/src/core/model/products_model.dart';
import 'package:st/src/services/remote/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

  // Products? products;
  // List<dynamic> data= [];
  List<Products> allProducts = [];
  Future getAllProducts() async {
    print('e');
    try {
      var response = await DioHelper.get(url: EndPoints.allProducts);

      var data = Products.fromJson(json.decode(response.data.toString()));

      // allProducts = response.data.map<Products>((dynamic item) =>
      //     Products.fromJson(item))
      //     .toList();

      // allProducts = Products.parseList(json.decode(response.data));
      // List<dynamic> body = map[""];
      // List<Products> homeProducts =
      //     map((dynamic item) => Products.fromJson(item)).toList();

      // Products.parseList(json.decode(response.data));

      print(data.runtimeType);
    } catch (e) {
      print(e.toString());
    }
  }
}
