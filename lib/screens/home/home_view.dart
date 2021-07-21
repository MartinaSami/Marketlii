import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketlii/api/auth_api.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/screens/home/search/search_screen.dart';
import 'package:marketlii/viewmodel/category/allcategoryscreen.dart';
import 'package:marketlii/viewmodel/category/category_view.dart';
import 'package:marketlii/viewmodel/product/allproductview.dart';
import 'package:marketlii/viewmodel/product/product_view.dart';
import 'package:marketlii/viewmodel/slider_view.dart';
import 'package:marketlii/widget/app_text.dart';

class HomeView extends StatefulWidget {
  static const String id = 'HomePage';


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
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
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   RemoteNotification notification = message.notification;
    //   AndroidNotification android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [Text(notification.body)],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              Row(
              
                children: [
                
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: 'اهلا بكم!',
                              color: AppColors.primary,
                              fontSize: 3.6,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(3),
                            ),
                            AppText(
                              text: 'هيا نحصل علي اجدد الاصدارات',
                              color: Colors.black54,
                              fontSize: 3.3,
                            ),
                          ],
                        ),
                      ),
                      TextButton(onPressed: () {
                        Auth().logOut(context);
                      }
                      , child: AppText(
                        text: 'تسجيل الخروج',
                        color: AppColors.primary,
                        fontSize: 3.6,
                      ),)
                

                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              InkWell(
                onTap: () {
                  Get.to(SearchScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.wight,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey[300]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        AppText(
                          text: 'ابحث عن ما تريد',
                          color: AppColors.grey,
                          letterSpacing: 1,
                          fontSize: 3.3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SliderView(),
              SizedBox(height: getProportionateScreenHeight(15)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(17),
                      width: getProportionateScreenWidth(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    AppText(
                      text: "العناصر",
                      fontSize: 3.7,
                      color: AppColors.primary,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(AllCategoryScreen());
                      },
                      child: Row(
                        children: [
                          AppText(
                            text: "الكل",
                            fontSize: 3.3,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: getSizeText(3.5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              CategoryView(),
              SizedBox(height: getProportionateScreenHeight(15)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(17),
                      width: getProportionateScreenWidth(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    AppText(
                      text: "المنتجات",
                      fontSize: 3.7,
                      color: AppColors.primary,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(AllProductView());
                      },
                      child: Row(
                        children: [
                          AppText(
                            text: "الكل",
                            fontWeight: FontWeight.bold,
                            fontSize: 3.3,
                            color: AppColors.grey,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: getSizeText(3.5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              ProductView()
            ],
          ),
        ));
  }
}
