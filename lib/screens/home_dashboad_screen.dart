import 'package:flutter/material.dart';
import 'package:grocery_app/model/categories.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/explore_screen.dart';
import 'package:grocery_app/screens/fav_screen.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/screens/shop_screen.dart';
import 'package:grocery_app/util/responsive.dart';
import 'package:grocery_app/util/shopping_colors.dart';
import 'package:grocery_app/widgets/nav_drawer.dart';
import 'package:provider/provider.dart';

class HomeDashBoardScreen extends StatefulWidget {
  @override
  _HomeDashBoardScreenState createState() => _HomeDashBoardScreenState();
}

class _HomeDashBoardScreenState extends State<HomeDashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  List<Product> _categoryProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget navigateToScreen() {
    switch (_currentIndex) {
      case 1:
        return ExploreScreen(
          categoryProducts: _categoryProducts,
        );
      case 2:
        return CartScreen();
      case 3:
        return FavScreen();
      case 0:
      default:
        return ShopScreen(
          categoryClick: (String categoryId) {
            setState(() {
              _categoryProducts = Provider.of<Categories>(context)
                  .getProductsById(context, categoryId);
              _currentIndex = 1;
            });
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isMobile(context) ? SizedBox() : NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        // elevation: 0,
        leading: !Responsive.isMobile(context)
            ? SizedBox()
            : GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset(
                      'shopping_assets/images/user.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return LoginUI();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
        backgroundColor: shrineGreen400,
        title: Text(
          'Find Products',
          style: TextStyle(fontFamily: 'Gilroy'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: shrineGreen400,
        foregroundColor: Colors.white,
        child: new Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: shrineGreen100,
        selectedItemColor: shrineGreen400,
        currentIndex: _currentIndex,
        // backgroundColor: colorScheme.surface,
        // selectedItemColor: colorScheme.onSurface,
        // unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        // selectedLabelStyle: textTheme.caption,
        // unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Shop'),
            icon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            title: Text('Explore'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Cart'),
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            title: Text('Favourite'),
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: navigateToScreen(),
    );
  }
}
