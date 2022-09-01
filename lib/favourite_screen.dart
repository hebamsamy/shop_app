import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Product.dart';
import 'package:shop_app/myFavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // List<Product> list = [];
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   list = Provider.of<MyFavourite>(context).list;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyFavourite>(builder: (context, value, child) {
      if (value.list.isEmpty) {
        return Center(
          child: Text("Empty"),
        );
      } else {
        return ListView.builder(
          itemCount: value.Count,
          itemBuilder: (context, index) => FavouriteItem(
            product: value.list[index],
          ),
        );
      }
    });
  }
}

class FavouriteItem extends StatefulWidget {
  Product product;
  FavouriteItem({required this.product});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.title),
      leading: IconButton(
          icon: Icon(
            Icons.favorite_sharp,
            color: Colors.red,
          ),
          onPressed: () {}),
    );
  }
}
