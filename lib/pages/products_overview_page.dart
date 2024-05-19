import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Minha Loja',
          style: TextStyle(
            fontFamily: 'Lato-Regular',
            fontSize: 18,
          ),
        ),
      ),
      body: const ProductGrid(),
    );
  }
}
