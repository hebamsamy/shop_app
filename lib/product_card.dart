import "package:flutter/material.dart";
import 'package:shop_app/Product.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.green[100],
      shadowColor: Colors.blueGrey,
      elevation: 20,
      child: Column(children: [
        Image.network(product.image),
        ListTile(
          leading: Text(product.title),
          trailing: Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(product.id.toString())
            ],
          ),
        )
      ]),
    );
  }
}
