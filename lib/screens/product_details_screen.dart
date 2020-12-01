import 'package:flutter/material.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/widgets/details/add_to_cart.dart';
import 'package:grocery_app/widgets/details/color_and_size.dart';
import 'package:grocery_app/widgets/details/counter_with_fav_btn.dart';
import 'package:grocery_app/widgets/details/description.dart';
const kDefaultPadding = 20.0;
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "${widget.product.id}",
                    child: Container(
                      // height: size.height * 0.3,
                      child: Image.asset(
                        widget.product.imageUrl,
                        fit: BoxFit.cover,
                        height: size.height * 0.4,
                        width: size.width,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height/2.8),
                    padding: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorAndSize(product: widget.product),
                        SizedBox(height: kDefaultPadding / 2),
                        Description(product: widget.product),
                        SizedBox(height: kDefaultPadding / 2),
                        CounterWithFavBtn(),
                        SizedBox(height: kDefaultPadding),
                        AddToCart(product: widget.product)
                      ],
                    ),
                  ),
                  // ProductTitleWithImage(product: widget.product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      /*leading: IconButton(
        icon: SvgPicture.asset(
          'shopping_assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),*/
      // actions: <Widget>[
      //   IconButton(
      //     icon: SvgPicture.asset("shopping_assets/icons/search.svg"),
      //     onPressed: () {},
      //   ),
      //   IconButton(
      //     icon: SvgPicture.asset("shopping_assets/icons/cart.svg"),
      //     onPressed: () {},
      //   ),
      //   SizedBox(width: kDefaultPaddin / 2)
      // ],
    );
  }
}
