import 'package:flutter/material.dart';
import 'package:st/src/ui/colors/static_colors.dart';
import 'package:st/src/ui/theme/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  static const String route = '/home';

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  void onPressed() {
    Navigator.pushNamed(context, '/second');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Column(
        children: const [Text('ss')],
      ),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: GlobalStaticColors.logoColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.shopping_basket_outlined)),
          IconButton(onPressed: onPressed, icon: const Icon(Icons.person)),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 270.0,
                child: Placeholder(),
              ),
              SizedBox(height: 10.0),
              Text(
                'I\'m looking for..',
                style: AppTheme.headerTextStyle,
              ),
              SizedBox(height: 10.0),
              HorizontalCategoriesListView(),
              SizedBox(height: 10.0),
              //Featured Products
              Text(
                'Featured Products',
                style: AppTheme.headerTextStyle,
              ),
              SizedBox(height: 10.0),
              FeaturedProducts(),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalCategoriesListView extends StatelessWidget {
  const HorizontalCategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            height: 150.0,
            width: 100,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Placeholder(),
    );
  }
}
