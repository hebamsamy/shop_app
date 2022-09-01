import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_app/APICalls.dart';
import 'package:shop_app/Product.dart';
import 'package:shop_app/productitem.dart';

class TabItem extends StatefulWidget {
  String label;
  Function callback = (int val) {
    print(val);
  };
  TabItem({required this.label});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  String label = "";
  List<Product> list = [];
  APICalls api = APICalls();
  @override
  void initState() {
    print(label);
    setState(() {
      print(widget.callback);
      label = widget.label;
      widget.callback(1);
    });
    super.initState();
    CallApi();
  }

  CallApi() async {
    var res = await api.GetProductByCategory(label);
    setState(() {
      list = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: SpinKitDoubleBounce(color: Colors.black),
      );
    } else {
      return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: list.length,
        itemBuilder: ((context, index) => Productitem(product: list[index])),
      );
    }
  }
}
