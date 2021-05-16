import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/model/fav.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/util/shopping_colors.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  // final Product product;
  //
  // const ProductWidget({Key key, this.product}) : super(key: key);

  void addProductToCart(BuildContext context, Product product, Cart cart) {
    cart.addItem(product.id, product.price, product.title, product.imageUrl);
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added item to cart!',
        ),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            cart.removeSingleItem(product.id);
          },
        ),
      ),
    );
  }
  void addProductToFav(BuildContext context, Product product, Fav fav) {
    fav.addItem(product.id, product.price, product.title, product.imageUrl);
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added item to favorite!',
        ),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            fav.removeSingleItem(product.id);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final product = Provider.of<Product>(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          child: Image.asset(
            product.imageUrl,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                foregroundDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      product.price.toString() + " ₹",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              addProductToCart(context, product, cart);
              print("Total Cart: " + cart.itemCount.toString());
            },
            child: Card(
              elevation: 10,
              color: shrineGreen400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0), // half of height and width of Image
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Consumer<Product>(
          builder: (ctx, product, _) {
            return Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: shrineGreen400,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            );
          },
        )
      ],
    );
  }
}