import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/cart/cart_view.dart';
import 'package:marketlii/screens/home/favorite/favorite_view.dart';
import 'package:marketlii/screens/home/home_view.dart';
import 'package:marketlii/screens/home/showitem/products_view.dart';
import 'package:marketlii/view/more_view.dart';

class MainScreenFav extends StatefulWidget {
  static const String id = 'MainScreenFav';
  @override
  _MainScreenFavState createState() => _MainScreenFavState();
}

class _MainScreenFavState extends State<MainScreenFav> {
  int currentIndex = 1;
  List<Widget> screens = [
    HomeView(),
    FavoriteView(),
    ProductsView(),
    CartView(),
    MoreView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'العربة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }
}
