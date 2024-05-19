import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
    required Product product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Contador'),
      ),
    );
  }
}
