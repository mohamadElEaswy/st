import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/navigation/navigation_methods.dart';
import 'package:st/src/ui/pages/home/home_page.dart';
import 'package:st/src/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Stabraq';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, index) {},
        builder: (context, index) {
          return MaterialApp(
            title: title,
            theme: AppTheme.lightTheme,
            home: const Home(title: title),
            onGenerateRoute: RouteMethods.generateRoutes,
            initialRoute: Home.route,
          );
        },
      ),
    );
  }
}
