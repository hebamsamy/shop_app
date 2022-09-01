import 'package:flutter/cupertino.dart';
import 'package:shop_app/Product.dart';

class MyFavourite extends ChangeNotifier {
  List<Product> _list = [];
  get list {
    return _list;
  }

  get Count {
    return _list.length;
  }

  addtoFav(Product val) {
    _list.add(val);
    notifyListeners();
  }

  bool isFav(Product val) {
    return _list.contains(val);
  }
  // addtoFav(Product val) {
  //   _list.add(val);
  //   notifyListeners();
  // }
}
