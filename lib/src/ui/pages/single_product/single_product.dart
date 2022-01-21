import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/model/products_model.dart';
import 'package:st/src/ui/widgets/loading_indicator.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({Key? key, required this.productNumber})
      : super(key: key);
  static const String route = '/single_product';
  final dynamic productNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final AppCubit bloc = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('Single Product'),
            ),
            body: ConditionalBuilder(
                condition:
                    !bloc.singleProductLoading && bloc.singleProduct != null,
                builder: (context) =>
                    _singleProduct(product: bloc.singleProduct!),
                fallback: (context) => const LoadingIndicator()));
      },
    );
  }

  Widget _singleProduct({required Product product}) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(product.title!),
                SizedBox(height: 100, child: Image.network(product.image!)),
                Text(product.price.toString()),
              ],
            ),
          ),
        ),
      );
}
