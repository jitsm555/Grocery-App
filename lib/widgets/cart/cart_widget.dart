import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/util/shopping_colors.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  CartWidget(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: shrineGreen400,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: TextStyle(color: kTextColor),
            ),
            content: Text('Do you want to remove the item from the cart?',
                style: TextStyle(color: kTextColor)),
            actions: <Widget>[
              FlatButton(
                child: Text('No', style: TextStyle(color: kTextColor)),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes', style: TextStyle(color: kTextColor)),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(imageUrl),
            backgroundColor: Colors.transparent,
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
