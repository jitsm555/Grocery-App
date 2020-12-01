import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/model/orders.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/util/shopping_colors.dart';
import 'package:grocery_app/widgets/cart/cart_widget.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20, color: kTextColor),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',

                    ),
                    backgroundColor: shrineGreen400,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                    textColor: shrineGreen400,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartWidget(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
                cart.items.values.toList()[i].imageUrl,
              ),
            ),
          )
        ],
    );
  }
}
