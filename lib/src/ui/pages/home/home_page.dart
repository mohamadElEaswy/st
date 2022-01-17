import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/l10n/l10n.dart';
import 'package:st/src/core/assets/assets.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/navigation/navigation_methods.dart';
import 'package:st/src/ui/locale/locale_ui_button.dart';
import 'package:st/src/ui/pages/cart/cart_page.dart';
import 'package:st/src/ui/pages/profile/profile_page.dart';
import 'package:st/src/ui/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const double contentPadding = 8.0;

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  static const String route = '/home';

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final AppCubit bloc = AppCubit.get(context);
        return Scaffold(
          drawer: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                  ),
                ],
              ),
            ),
          ),
          body: buildBody(bloc: bloc),
        );
      },
    );
  }

  Widget buildBody({required AppCubit bloc}) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          floating: true,
          actions: [
            Text(
              AppLocalizations.of(context)!.helloworld,
            ),
            const LanguagePickerWidget(),
            IconButton(
              tooltip: 'profile',
              onPressed: () async {
                await bloc.getAllProducts();
                // print(bloc.products!);
                // RouteMethods.navigateTo(
                //     context: context, routeName: Profile.route);
              },
              icon: const Icon(Icons.person_outline_rounded),
            ),
            IconButton(
              tooltip: 'cart',
              onPressed: () => RouteMethods.navigateTo(
                  context: context, routeName: Cart.route),
              icon: const Icon(Icons.shopping_basket_outlined),
            ),
          ],
          title: Image.asset(
            AppAssets.appLogo,
            fit: BoxFit.fitHeight,
            height: 25.0,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 270.0,
            child: Placeholder(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Center(
              child: Text(
                'I\'m looking for..',
                style: AppTheme.headerTextStyle,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const SizedBox(
                  width: 100.0,
                  child: Card(
                    child: Text('data'),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Center(
              child: Text(
                'Featured Products',
                style: AppTheme.headerTextStyle,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(contentPadding),
              child: Center(
                child: SizedBox(
                  height: 20.0,
                  child: Text('$index'),
                ),
              ),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
} /*no way home no no */

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        child: Text(
          flag,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}

