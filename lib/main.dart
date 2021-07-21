import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/provider/childCategories/leve_3.dart';
import 'package:marketlii/provider/childCategories/level_1.dart';
import 'package:marketlii/provider/childCategories/level_2.dart';
import 'package:marketlii/provider/childCategories/level_4.dart';
import 'package:marketlii/provider/home_providers/category/categroy.dart';
import 'package:marketlii/provider/home_providers/category/sup_category.dart';
import 'package:marketlii/provider/home_providers/favorite_provider.dart';
import 'package:marketlii/provider/home_providers/product.dart';
import 'package:marketlii/provider/home_providers/slider_provider.dart';
import 'package:marketlii/provider/order_provider/cart_provider.dart';
import 'package:marketlii/provider/order_provider/orderdetails_provider.dart';
import 'package:marketlii/provider/order_provider/orders_provider.dart';
import 'package:marketlii/provider/profile_provider.dart';
import 'package:marketlii/provider/reta_provider.dart';
import 'package:marketlii/provider/search_provider.dart';
import 'package:marketlii/provider/show_item_provider.dart';
import 'package:marketlii/screens/auth/login_view.dart';
import 'package:marketlii/screens/auth/signup_view.dart';
import 'package:marketlii/screens/home/cart/cart_view.dart';
import 'package:marketlii/screens/home/favorite/favorite_view.dart';
import 'package:marketlii/screens/home/home_view.dart';
import 'package:marketlii/screens/home/search/dell_filter.dart';
import 'package:marketlii/screens/home/search/laptop_filter.dart';
import 'package:marketlii/view/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (_) => CategoryProvider()),
        ChangeNotifierProvider<SupCategoryProvider>(
            create: (_) => SupCategoryProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
        ChangeNotifierProvider<ShowProductProvider>(
            create: (_) => ShowProductProvider()),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<FavoriteProvider>(
            create: (_) => FavoriteProvider()),
        ChangeNotifierProvider<OrdersProvider>(create: (_) => OrdersProvider()),
        ChangeNotifierProvider<OrderDetailsProvider>(
            create: (_) => OrderDetailsProvider()),
        ChangeNotifierProvider<SliderProvider>(create: (_) => SliderProvider()),
        ChangeNotifierProvider<LEVEL_2>(create: (_) => LEVEL_2()),
        ChangeNotifierProvider<LEVEL_4>(create: (_) => LEVEL_4()),
        ChangeNotifierProvider<LEVEL_3>(create: (_) => LEVEL_3()),
        ChangeNotifierProvider<LEVEL_1>(create: (_) => LEVEL_1()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<RateProvider>(create: (_) => RateProvider()),
      ],
      child: GetMaterialApp(
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child,
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Cairo',
            textTheme: TextTheme(
                bodyText1: TextStyle(
              fontFamily: 'Cairo',
            ))),
        home: MyApp2(),
        routes: {
          LoginView.id: (context) => LoginView(),
          SignUpView.id: (context) => SignUpView(),
          MainScreen.id: (context) => MainScreen(),
          HomeView.id: (context) => HomeView(),
          FavoriteView.id: (context) => FavoriteView(),
          CartView.id: (context) => CartView(),
          LaptopFilter.id: (context) => LaptopFilter(),
          DellFilter.id: (context) => DellFilter(),
        },
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print('token $token');
    if (token != null) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainScreen()));
    } else if (token == null) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginView()));
      prefs.setBool('seen', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MainScreen();
  }
}
