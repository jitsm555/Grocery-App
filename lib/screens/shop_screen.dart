import 'package:flutter/material.dart';
import 'package:grocery_app/model/categories.dart';
import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/util/responsive.dart';
import 'package:grocery_app/widgets/nav_drawer.dart';
import 'package:grocery_app/widgets/shop/category_widget.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  final Function? categoryClick;

  const ShopScreen({Key? key, this.categoryClick}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TextEditingController editingController = TextEditingController();
  late List<Category> _categories;



  @override
  Widget build(BuildContext context) {
    _categories = Provider.of<Categories>(context).items;
    return Row(
      children: [
        Responsive.isMobile(context) ? SizedBox() : NavDrawer(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(16.0),
                  itemBuilder: (_, index) {
                    Category category = _categories[index];
                    return CategoryWidget(
                      category: category,
                      onTap: (String id) {
                        print('Product List of Category search id: ' + id);
                        setState(() {
                          widget.categoryClick!(id);
                        });
                      },
                    );
                  },
                  itemCount: _categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.getCrossAxisCount(context),
                    // childAspectRatio: 200 / 220,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
