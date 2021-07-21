import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/cart/cart_view.dart';
import 'package:marketlii/screens/home/home_view.dart';
import 'package:marketlii/screens/home/showitem/products_view.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool network = false;
  checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        network = false;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        network = false;
      });
    } else {
      setState(() {
        network = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkNetwork();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    ProductsView(),
    CartView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: network
          ? Center(
              child: OutlineButton(
                child: Text('تاكد من وجود الانترنت'),
                onPressed: () {
                  checkNetwork();
                },
              ),
            )
          : screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 15,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
        ),
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
            icon: Icon(Icons.apps),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'العربة',
          ),

        ],
      ),
    );
  }
}
