import 'package:flutter/material.dart';
import 'package:frutto/widgets/ingredient.dart';
import 'package:frutto/widgets/product.dart';
import 'package:frutto/widgets/show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<ProductModel> products = [];

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _controller;

  final ProductModel _product = const ProductModel(
    name: 'مربى الفراولة',
    color: Colors.red,
    width: 270,
    height: 415,
    ingredients: [
      IngredientModel(
        name: 'chocolate',
        icon: Icons.cookie,
        color: Colors.brown,
      ),
      IngredientModel(
        name: 'avocado',
        icon: Icons.egg_alt,
        color: Colors.lightGreen,
      ),
      IngredientModel(
        name: 'strawberry',
        icon: Icons.bakery_dining_sharp,
        color: Colors.red,
      ),
      // IngredientModel(
      //   name: 'avocado',
      //   icon: Icons.egg_alt,
      //   color: Colors.lightGreen,
      // ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: products.length ~/ 2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [Show(product: _product)],
      ),
    );
  }
}
