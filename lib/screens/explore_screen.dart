import 'package:flutter/material.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/products.dart';
import 'package:grocery_app/screens/product_details_screen.dart';
import 'package:grocery_app/util/responsive.dart';
import 'package:grocery_app/widgets/explore/product_widget.dart';
import 'package:grocery_app/widgets/nav_drawer.dart';
import 'package:provider/provider.dart';
class ExploreScreen extends StatefulWidget {
  final List<Product>? categoryProducts;

  const ExploreScreen({Key? key, this.categoryProducts}) : super(key: key);
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Product>? _products;
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.categoryProducts == null || widget.categoryProducts!.isEmpty) {
      _products = Provider.of<Products>(context).items;
    } else {
      _products = widget.categoryProducts;
    }
    return Row(
      children: [
        Responsive.isMobile(context) ? SizedBox() : NavDrawer(),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.grey.withOpacity(0.4),
                  autofocus: false,
                  style: TextStyle(color: Colors.black54),
                  onChanged: (value) {
                    // filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      hintText: "Search Store",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      hoverColor: Colors.grey.withOpacity(0.1),
                      focusColor: Colors.grey.withOpacity(0.1),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(16.0),
                  itemBuilder: (_, index) {
                    Product product = _products![index];
                    return ChangeNotifierProvider.value(
                      value: product,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                            return ProductDetailsScreen(product: product);
                          }));
                        },
                        child: ProductWidget(),
                      ),
                    );
                  },
                  itemCount: _products!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.getCrossAxisCount(context),
                    // childAspectRatio: 200 / 220,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
