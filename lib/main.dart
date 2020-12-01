import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/model/categories.dart';
import 'package:grocery_app/model/orders.dart';
import 'package:grocery_app/model/products.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/util/shopping_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: buildShrineTheme(),
          home: LoginUI(),
          routes: {
            // ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            // CartScreen.routeName: (ctx) => CartScreen(),
            // OrdersScreen.routeName: (ctx) => OrdersScreen(),
            // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            // EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}
