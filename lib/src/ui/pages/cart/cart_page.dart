import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  static const String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: ElevatedButton(
                  onPressed: (){},
                  child: const Text('try')),
            ),
          ),
        );
      },
    );
  }
}
