import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/util/shopping_colors.dart';
import 'package:provider/provider.dart';

class FavWidget extends StatelessWidget {
  final Product? product;

  const FavWidget({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product!.id),
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
            content: Text('Do you want to remove the item from the favorites?',
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
                  product!.toggleFavoriteStatus();
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(product!.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(product!.imageUrl),
            backgroundColor: Colors.transparent,
          ),
          title: Text(product!.title),
          subtitle: Text('Total: \$${(product!.price * product!.price)}'),
          trailing: Text('${product!.price} x'),
        ),
      ),
    );
  }
}
