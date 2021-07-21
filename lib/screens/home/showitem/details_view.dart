import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../auth/login_view.dart';

class DetailsView extends StatelessWidget {
  static const String id = 'DetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'حذاء كاجوال رياضي  سهل الارتداء - كحلي',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0XFF242451),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset(
                      'assets/images/blueshoescover.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/blueshoescover.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/blueshoescover.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                  dotSize: 8,
                  dotSpacing: 18,
                  dotColor: Colors.white,
                  indicatorBgPadding: 8,
                  dotBgColor: Color(0XFF242451).withOpacity(.2),
                  dotIncreasedColor: Color(0XFF242451),
                  dotIncreaseSize: 1.5,
                ),
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
                          'حذاء كاجوال رياضي  سهل الارتداء- كحلي',
                          style: TextStyle(
                              color: Color.fromRGBO(36, 36, 81, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          '100ج.م',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF242451),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        thickness: 2,
                        color: Color(0XFF242451),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/color_icon.png',
                          width: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'الالوان',
                          style: TextStyle(
                              color: Color(0XFF242451),
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/blueshoes.png'),
                        Image.asset('assets/images/blackshoes.png'),
                        Image.asset('assets/images/orangeshoes.png'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/resize.png',
                          width: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'المقاس',
                          style: TextStyle(
                              color: Color(0XFF242451),
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              '42',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0XFF242451),
                                  fontSize: 18,
                                  height: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0XFF242451),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '42',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0XFF242451),
                                  fontSize: 18,
                                  height: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0XFF242451),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '45',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0XFF242451),
                                border: Border.all(
                                  color: Color(0XFF242451),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
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
                                fontSize: 17),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0XFF242451),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'بما ان راحه الجسم تبدأ دائما من راحه القدم و تاتي راحه القدم '
                      'من الحذاء الخفيف الطري المصنوع بناء علي تصميم طبي '
                      'يريح القدم طول اليوم اثناء السير الطويل والوقوف باستمرار',
                      style: TextStyle(
                          color: Color(0XFF242451),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0XFF242451),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'فيديو للمنتج',
                            style: TextStyle(
                                color: Color(0XFF242451),
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0XFF242451),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/pair-trainers.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              size: 30,
                            ),
                            onPressed: () {}),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              size: 30,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                    Text(
                      'الكمية',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        color: Color(0XFF242451),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
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
                                                            'حذاء كاجوال رياضي  سهل الارتداء- كحلي',
                                                            style: TextStyle(
                                                                fontSize: 11,
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
                                                          ' 100 ج.م',
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
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0XFF242451),
                                                                )),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          child: Text(
                                                            'نشوف حجات تانية',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                    Expanded(
                                                        child: FlatButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .leftToRight,
                                                            child: LoginView(),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0XFF242451),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                border:
                                                                    Border.all(
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
                                                                fontSize: 12,
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
                                          ),
                                        )),
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
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Color(0XFF242451),
                            ),
                            Text(
                              'اطلب الان',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 40,
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
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
