import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(col ),
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {},
            ),
          ),
        ],
      )),
    );
  }
}
