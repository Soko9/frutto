import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:frutto/models/product_model.dart';
import 'package:frutto/widgets/indicator.dart';
import 'package:frutto/widgets/show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _controller;

  int _currentPage = 0;

  final Duration _transitionDuration = 250.ms;
  final Cubic _transitionCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _currentPage,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> next() async {
    if (_controller.page?.toInt() == ProductModel.products.length - 1) {
      await _controller.animateToPage(
        0,
        duration: _transitionDuration * (ProductModel.products.length - 1),
        curve: _transitionCurve,
      );
      return;
    }
    await _controller.nextPage(
      duration: _transitionDuration,
      curve: _transitionCurve,
    );
  }

  Future<void> prev() async {
    if (_controller.page?.toInt() == 0) {
      await _controller.animateToPage(
        ProductModel.products.length - 1,
        duration: _transitionDuration * (ProductModel.products.length - 1),
        curve: _transitionCurve,
      );
      return;
    }
    await _controller.previousPage(
      duration: _transitionDuration,
      curve: _transitionCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < ProductModel.products.length; i++)
                  Show(
                    product: ProductModel.products[i],
                    isActive: _currentPage == i,
                  ),
              ],
            ),
          ),
          Indicator(
            next: next,
            prev: prev,
            length: ProductModel.products.length,
            currentActiveIndex: _currentPage,
          ),
        ],
      ),
    );
  }
}
