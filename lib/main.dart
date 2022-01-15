import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:st/l10n/l10n.dart';
import 'package:st/provider/locale_provider.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/navigation/navigation_methods.dart';
import 'package:st/src/ui/pages/home/home_page.dart';
import 'package:st/src/ui/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          return ChangeNotifierProvider<LocaleProvider>(
              create: (context) => LocaleProvider(),
              builder: (context, child) {
                final provider = Provider.of<LocaleProvider>(context);
                return MaterialApp(
                  title: title,
                  theme: AppTheme.lightTheme,
                  home: const Home(title: title),
                  onGenerateRoute: RouteMethods.generateRoutes,
                  initialRoute: Home.route,
                  locale: provider.locale,
                  supportedLocales: L10n.all,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                );
              });
        },
      ),
    );
  }
}
