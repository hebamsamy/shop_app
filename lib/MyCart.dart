import 'package:flutter/cupertino.dart';
import 'package:shop_app/Product.dart';

class MyCart extends ChangeNotifier {
  List<Cart> _list = [];
  static int num = 1;
  get list {
    return _list;
  }

  get Count {
    return _list.length;
  }

  addtoCart(Product val) {
    _list.add(Cart(id: num++, Qty: 1, product: val));
    notifyListeners();
  }

  RemovetoCart(Cart val) {
    _list.remove(val);
    notifyListeners();
  }
}

class Cart {
  int id;
  int Qty;
  double subPrice = 1;
  Product product;
  Cart({
    required this.id,
    required this.Qty,
    required this.product,
  }) {
    this.subPrice = this.Qty * this.product.price;
  }
}
