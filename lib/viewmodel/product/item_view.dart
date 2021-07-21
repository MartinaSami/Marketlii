import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/showproduct_model.dart';
import 'package:marketlii/provider/order_provider/cart_provider.dart';
import 'package:marketlii/provider/reta_provider.dart';
import 'package:marketlii/provider/show_item_provider.dart';
import 'package:marketlii/screens/home/cart/cart/newcheckout.dart';
import 'package:marketlii/screens/home/rate/get_all_rate.dart';
import 'package:marketlii/screens/home/rate/rate_body.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProductView extends StatefulWidget {
  String id;
  ShowProductView({this.id});
  @override
  _ShowProductViewState createState() => _ShowProductViewState();
}

class _ShowProductViewState extends State<ShowProductView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoriesData =
        Provider.of<ShowProductProvider>(context, listen: false);
    categoriesData.callAPIForOneProductData(widget.id);
    final rateData = Provider.of<RateProvider>(context, listen: false);
    rateData.callAPIForRateData(widget.id);
    return Scaffold(
      bottomNavigationBar:
          Consumer<ShowProductProvider>(builder: (_, pragma, __) {
        return pragma.getOneProductData == null
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          String token = sharedPreferences.getString('token');
                          if (token == null) {
                            return Fluttertoast.showToast(
                                msg: "برجاء تسجيل الدخول اولا",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(
                                    categoriesData.getOneProductData.data.id
                                        .toString(),
                                    '');
                            return showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              transitionDuration: Duration(milliseconds: 500),
                              barrierLabel:
                                  MaterialLocalizations.of(context).dialogLabel,
                              barrierColor: Colors.black.withOpacity(0.5),
                              pageBuilder: (context, _, __) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SafeArea(
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 20),
                                              child: Material(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .assignment_turned_in_outlined,
                                                          color: Colors.green,
                                                          size: 35,
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.55,
                                                              child: Text(
                                                                pragma
                                                                    .getOneProductData
                                                                    .data
                                                                    .name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            Text(
                                                              'في عربة التسوق',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'مجموع العربة',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                            Text(
                                                              pragma
                                                                  .getOneProductData
                                                                  .data
                                                                  .price,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                3),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0XFF242451),
                                                                    )),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: Text(
                                                                'نشوف حجات تانية',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                        Expanded(
                                                            child: FlatButton(
                                                          onPressed: () async {
                                                            Get.to(
                                                                NewCheckOutScreen(
                                                              priec: Provider.of<
                                                                          CartProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .list
                                                                  .total
                                                                  .toString(),
                                                            ));
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Color(
                                                                        0XFF242451),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                3),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0XFF242451),
                                                                    )),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: Text(
                                                                'إتمام الشراء',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ))),
                                    ),
                                  ],
                                );
                              },
                              transitionBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOut,
                                  ).drive(Tween<Offset>(
                                    begin: Offset(0, -1.0),
                                    end: Offset.zero,
                                  )),
                                  child: child,
                                );
                              },
                            );
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
                            text: 'اطلب الان',
                            fontSize: 3.6,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
      }),
      body: SafeArea(
        child: SizedBox(child: Consumer<ShowProductProvider>(
          builder: (_, pragma, __) {
            Widget content = Center(
                child: Text(pragma.errorMessage != null
                    ? pragma.errorMessage
                    : "No Data for you"));
            if (!pragma.isLoading) {
              content = pragma.getOneProductData == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _buildList(pragma.getOneProductData, context, widget.id);
            } else if (!pragma.isLoading &&
                pragma.getOneProductData.Category == null) {
              content = Center(
                  child: Text(pragma.errorMessage != null
                      ? pragma.errorMessage
                      : "No Data for you"));
            } else
              content = Center(child: CircularProgressIndicator());
            return content;
          },
        )),
      ),
    );
  }
}

Widget _buildList(ShowProduct showProduct, BuildContext context, String id) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: getProportionateScreenHeight(150),
                width: double.infinity,
                child: Image.network(showProduct.data.imagePath),
              ),
              Positioned(
                  left: 10,
                  top: 5,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      showProduct.data.name,
                      style: TextStyle(
                          color: Color.fromRGBO(36, 36, 81, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Text(
                      showProduct.data.price,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF242451),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        itemSize: MediaQuery.of(context).size.height * 0.018,
                        initialRating: double.parse('3.5'),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: MediaQuery.of(context).size.height * 0.012,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0XFF242451),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'التفاصيل',
                        style: TextStyle(
                            color: Color(0XFF242451),
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0XFF242451),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    showProduct.data.description,
                    style: TextStyle(
                        color: Color(0XFF242451),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0XFF242451),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'التقيمات',
                        style: TextStyle(
                            color: Color(0XFF242451),
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0XFF242451),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(AllRate(
                      scrol: true,
                      id: showProduct.data.id.toString(),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('الكل', style: TextStyle(
                      color: Color(0XFF242451),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,),),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: RateBody(
                    count: 1,
                    id: showProduct.data.id.toString(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
