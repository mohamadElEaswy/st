import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st/l10n/l10n.dart';
import 'package:st/src/core/assets/assets.dart';
import 'package:st/src/core/bloc/cubit/cubit.dart';
import 'package:st/src/core/bloc/states/states.dart';
import 'package:st/src/core/model/serialize_model.dart';
import 'package:st/src/core/navigation/navigation_methods.dart';
import 'package:st/src/ui/locale/locale_ui_button.dart';
import 'package:st/src/ui/pages/login/login_page.dart';
import 'package:st/src/ui/pages/register/register.dart';
import 'package:st/src/ui/pages/single_product/single_product.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit bloc = AppCubit.get(context);
        return SafeArea(bottom: true,top: true,
          child: Scaffold(
            drawer: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.language),
                    const LanguagePickerWidget(),
                  ],
                ),
              ),
            ),
            body: !bloc.productsLoading
                ? buildBody(bloc: bloc, screenWidth: screenWidth)
                : const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget buildBody({required AppCubit bloc, double? screenWidth}) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          floating: true,
          actions: [
            IconButton(
              tooltip: 'profile',
              onPressed: () {
                RouteMethods.navigateTo(context: context, routeName: LoginPage.route);
              },
              icon: const Icon(Icons.person_outline_rounded),
            ),
            IconButton(
              tooltip: 'cart',
              onPressed: () => RouteMethods.navigateTo(
                  context: context, routeName: RegisterPage.route),
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
              padding: const EdgeInsets.all(10.0),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: bloc.categoriesList.length,
              itemBuilder: (context, index) {
                return _categoriesListItem(
                  item: bloc.categoriesList[index],
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
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 600.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(contentPadding),
                  child: _productListItem(
                      bloc: bloc,
                      product: bloc.productsList[index],
                      screenWidth: screenWidth));
            },
            childCount: bloc.productsList.length,
          ),
        )
      ],
    );
  }

  Widget _productListItem(
      {required Product product, required AppCubit bloc, double? screenWidth}) {
    return ListTile(
        onTap: () async {
          bloc.getSingleProduct(productNumber: product.id);
          RouteMethods.navigateTo(
            context: context,
            routeName: SingleProductPage.route,
            args: product.id,
          );
        },
        leading: SizedBox(
            height: 120, width: 60, child: Image.network(product.image)),
        title: Text(product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text('LE ' + product.price.toString(),
            style: Theme.of(context).textTheme.bodyMedium));
  }

  Widget _categoriesListItem({required item}) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(item, style: Theme.of(context).textTheme.headline6)));
}

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
