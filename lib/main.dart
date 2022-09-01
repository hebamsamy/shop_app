import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/APICalls.dart';
import 'package:shop_app/MyCart.dart';
import 'package:shop_app/cart_screen.dart';
import 'package:shop_app/favourite_screen.dart';
import 'package:shop_app/home_screen.dart';
import 'package:shop_app/login_Screen.dart';
import 'package:shop_app/myFavourite.dart';
import 'package:shop_app/settings_screen.dart';
import 'package:shop_app/tab_Item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MyFavourite(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyCart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(color: Color.fromARGB(174, 0, 0, 0)),
            backgroundColor: Colors.white),
        home: SliverTab(),
      ),
    );
  }
}

class SliverTab extends StatefulWidget {
  const SliverTab({Key? key}) : super(key: key);

  @override
  _SliverTabState createState() => _SliverTabState();
}

class _SliverTabState extends State<SliverTab> {
  List list = [];

  APICalls api = APICalls();

  CallApi() async {
    var retlist = await api.GetCategory();
    setState(() {
      list = retlist;
    });
  }

  @override
  void initState() {
    super.initState();
    CallApi();
  }

  int selected = 0;
  List<Widget> Screens = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty)
      return Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
        ),
      );
    else
      return DefaultTabController(
        length: list.length,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 70,
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
              ),
            ),
            title: Column(children: [
              Text(
                "Hello Smith,",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Welcome back !!",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ]),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.login,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
              )
            ],
            bottom: (selected == 0)
                ? TabBar(
                    indicatorColor: Colors.grey,
                    isScrollable: true,
                    tabs: list
                        .map(
                          (label) => Tab(
                            child: Text(label),
                          ),
                        )
                        .toList(),
                  )
                : null,
          ),
          body: (selected == 0)
              ? TabBarView(
                  children: list.map((label) => TabItem(label: label)).toList(),
                )
              : Screens[selected],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                selected = value;
              });
            },
            backgroundColor: Color.fromARGB(174, 0, 0, 0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            currentIndex: selected,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: (selected != 0)
                    ? Icon(Icons.home_outlined)
                    : Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: (selected != 1)
                    ? Icon(Icons.favorite_border_outlined)
                    : Icon(Icons.favorite),
                label: "Favorite ${Provider.of<MyFavourite>(context).Count}",
              ),
              BottomNavigationBarItem(
                  icon: (selected != 2)
                      ? Icon(Icons.shopping_bag_outlined)
                      : Icon(Icons.shopping_bag),
                  label: "Cart ${Provider.of<MyCart>(context).Count}"),
              BottomNavigationBarItem(
                  icon: (selected != 3)
                      ? Icon(Icons.settings_outlined)
                      : Icon(Icons.settings),
                  label: "Settings"),
            ],
          ),
        ),
      );
  }
}
