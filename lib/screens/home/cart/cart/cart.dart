import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/cart_model.dart';
import 'package:marketlii/provider/order_provider/cart_provider.dart';
import 'package:marketlii/screens/auth/login_view.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'newcheckout.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool a;
  checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    if (token == null) {
      setState(() {
        a = true;
        print('is $a');
      });
    } else {
      setState(() {
        a = false;
        print('is $a');
      });
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoriesData = Provider.of<CartProvider>(context, listen: false);
    categoriesData.callAPIForCartData();
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: a == null
                  ? Container()
                  : a
                      ? Center(
                          child: OutlineButton(
                            child: Text('برجاء تسجيل الدخول'),
                            onPressed: () {
                              Get.to(LoginView());
                            },
                          ),
                        )
                      : Container(child: Consumer<CartProvider>(
                          builder: (_, pragma, __) {
                            Widget content =
                                pragma.getCategoriesModelData == null
                                    ? Center(child: CircularProgressIndicator())
                                    : _buildList(
                                        pragma.getCategoriesModelData, context);
                            return content;
                          },
                        )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildList(Cart cart, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      Expanded(
        child: Provider.of<CartProvider>(context, listen: false).count == 0
            ? Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'العربة فارغة',
                  ),
                ],
              ))
            : Container(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return _buildItem(cart.data[index], context);
                  },
                  itemCount: cart.data.length,
                ),
              ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -5),
                  blurRadius: 15,
                  color: Colors.grey.withOpacity(0.1))
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'المجمل',
                    color: Colors.black,
                    fontSize: 3.8,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          Provider.of<CartProvider>(context, listen: false)
                                      .count ==
                                  0
                              ? '0'
                              : '${cart.total}',
                          style: TextStyle(
                              fontSize: size.height * 0.024,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: 'EGP',
                          color: AppColors.primary,
                          fontSize: 3.6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: FlatButton(
                  padding: EdgeInsets.all(5),
                  onPressed: () {
                    if (Provider.of<CartProvider>(context, listen: false)
                            .count ==
                        0) {
                      CustomSnackBar()
                          .errorShowSnackBar('لا يوجد منتجات في السلة');
                    } else {
                      Get.to(NewCheckOutScreen(
                        priec: cart.total.toString(),
                      ));
                    }
                  },
                  child: Container(
                    height: size.height * 0.06,
                    alignment: Alignment.center,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary),
                    child: AppText(
                      text: 'دفع',
                      fontSize: 3.6,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildItem(CartDatum product, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Column(
      children: [
        Provider.of<CartProvider>(context, listen: false).count == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            :  Dismissible(
                key: ValueKey(product.productId),
                background: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      )),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  String url = "https://marketlii.matsuda.website/api/remove_cart";
                  String id = product.productId.toString();
                  Provider.of<CartProvider>(context, listen: false)
                      .decreaseProduct(id, url);
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: AppColors.grey.withOpacity(0.3),
                            blurRadius: 5)
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.image,
                              width: size.height * 0.110,
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.360,
                            child: AppText(
                              text: product.name,
                              color: Colors.black,
                              fontSize: 3.4,
                            ),
                          ),
                          Row(
                            children: [
                              AppText(
                                text: '${product.price.toString()}',
                                color: AppColors.yellow,
                                fontSize: 3.4,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                RatingBar.builder(
                                  itemSize: size.height * 0.018,
                                  initialRating: double.parse('3.5'),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: size.height * 0.012,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              String token =
                                  sharedPreferences.getString('token');
                              print(token);
                              String url =
                                  "https://marketlii.matsuda.website/api/decrease_cart";
                              String id = product.productId.toString();
                              print(id);
                              Provider.of<CartProvider>(context, listen: false)
                                  .decreaseProduct(
                                id,
                                url,
                              );
                            },
                            child: AppText(
                              text: '-',
                              fontSize: 3.9,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: AppText(
                                text: product.quantity.toString(),
                                fontSize: 3,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              String token =
                                  sharedPreferences.getString('token');
                              String url =
                                  "https://marketlii.matsuda.website/api/increase_cart";
                              String id = product.productId.toString();
                              print(token);
                              Provider.of<CartProvider>(context, listen: false)
                                  .decreaseProduct(
                                id,
                                url,
                              );
                            },
                            padding: EdgeInsets.all(0),
                            child: AppText(
                              text: '+',
                              fontSize: 3.9,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ],
    ),
  );
}
