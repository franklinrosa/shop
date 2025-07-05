import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                // size: 16,
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            style: const TextStyle(fontSize: 13),
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            alignment: Alignment.centerRight,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Produto adicionado com suscesso!'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
              cart.addItem(product);
              //     print(cart.itemsCount);
            },
            icon: const Icon(
              Icons.shopping_cart,
              // size: 16,
            ),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productDetail,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}
