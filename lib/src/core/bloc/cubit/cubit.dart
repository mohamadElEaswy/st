// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/end_points/end_points.dart';
import 'package:st/src/core/model/products_model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

// this function work automatically while the app start
  Future fetch() async{
    getAllProducts();
  }

  bool loading = true;
  List<Product>? productsList;

  Future<List<Product>?> getAllProducts() async {
    print('loading');
    emit(LoadingAppState());
    try {
      var response = await http.get(Uri.parse(EndPoints.allProducts));
      if (response.statusCode == 200) {
        productsList = (json.decode(response.body) as List)
            .map((i) => Product.fromJson(i))
            .toList();
        loading = false;
        emit(SuccessAppState());
      } else {
        print(response.statusCode);
        loading = false;
        emit(ErrorAppState(error: response.statusCode.toString()));
      }
    } catch (e) {
      print(e.toString());
      loading = false;
      emit(ErrorAppState(error: e.toString()));
    }
    return null;
  }



}
