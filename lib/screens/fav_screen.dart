import 'package:flutter/material.dart';
import 'package:grocery_app/model/products.dart';
import 'package:grocery_app/widgets/fav/FavWidget.dart';
import 'package:provider/provider.dart';
class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).favoriteItems;
    return Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) => FavWidget(
                 product: products[i],
              ),
            ),
          )
        ],
    );
  }
}
