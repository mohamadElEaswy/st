import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/model/serialize_model.dart';
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
              builder: (context) => _singleProduct(
                  product: bloc.singleProduct!, context: context),
              fallback: (context) => const LoadingIndicator()),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Add to cart'),
          ),
        );
      },
    );
  }

  Widget _singleProduct(
          {required Product product, required BuildContext context}) =>
      SingleChildScrollView(padding: const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                // height: 400,
                child: Image.network(product.image),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleLarge,
              // textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'LE' + product.price.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 10),
            Text(product.rating.rate.toString()),

          ],
        ),
      );
}
