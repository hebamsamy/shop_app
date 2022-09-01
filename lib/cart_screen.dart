import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/MyCart.dart';
import 'package:shop_app/Product.dart';
import 'package:shop_app/product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyCart>(builder: (context, value, child) {
      if (value.list.isEmpty) {
        return Center(
          child: Text("Empty"),
        );
      } else {
        return GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 6 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: value.list.length,
          itemBuilder: ((context, index) => CartItem(item: value.list[index])),
        );
      }
    });
  }
}

class CartItem extends StatefulWidget {
  Cart item;
  CartItem({required this.item});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyCart>(
      builder: (context, value, child) => Dismissible(
        onDismissed: (direction) {
          value.RemovetoCart(widget.item);
        },
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: Text("Remo"),
                    content: Text("are you Sure??"),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          icon: Icon(Icons.check)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          icon: Icon(Icons.close)),
                    ],
                  )));
        },
        direction: DismissDirection.endToStart,
        key: ValueKey(widget.item.id),
        background: Container(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 70,
          ),
        ),
        child: GridTile(
          child: Image.network(
            widget.item.product.image,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: IconButton(icon: Icon(Icons.add), onPressed: () {}),
            trailing: IconButton(icon: Icon(Icons.remove), onPressed: () {}),
            title: Text(widget.item.product.title),
            backgroundColor: Colors.black54,
          ),
        ),
      ),
    );
  }
}
