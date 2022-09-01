import 'package:flutter/material.dart';
import 'package:shop_app/Product.dart';
import 'package:shop_app/product_card.dart';

import 'APICalls.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String inputData = "";
  List<Product> list = [];
  APICalls api = APICalls();
  callApi() async {
    list = [];
    var retlist = await api.GetPopularProducts();
    setState(() {
      list = retlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                    // borderSide: BorderSide(col ),
                    borderRadius: BorderRadius.circular(15))),
            onChanged: (value) {
              setState(() {
                inputData = value;
              });
              callApi();
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => ProductCard(
              product: list[index],
            ),
          ),
        )
      ],
    );
  }
}
