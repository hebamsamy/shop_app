import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shop_app/MyCart.dart';
import 'package:shop_app/Product.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/myFavourite.dart';

class Productitem extends StatelessWidget {
  Product product;
  Productitem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: Image.network(
          product.image,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          leading: Consumer<MyFavourite>(
            builder: (context, value, child) => IconButton(
                icon: Icon(Icons.favorite_sharp,
                    color: (value.isFav(product) ? Colors.red : Colors.white)),
                onPressed: () {
                  print(product.id);
                  value.addtoFav(product);
                }),
          ),
          trailing: Consumer<MyCart>(
            builder: (context, value, child) => IconButton(
                icon: Icon(Icons.shopping_bag_sharp),
                onPressed: () {
                  value.addtoCart(product);
                }),
          ),
          title: Text(product.title),
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }
}
