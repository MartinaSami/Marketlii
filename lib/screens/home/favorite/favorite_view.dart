import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/provider/home_providers/favorite_provider.dart';
import 'package:marketlii/screens/auth/login_view.dart';
import 'package:marketlii/viewmodel/product/item_view.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteView extends StatefulWidget {
  static const String id = 'FavoriteView';

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
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
    var favoriteData = Provider.of<FavoriteProvider>(context, listen: false);
    favoriteData.callAPIForFavoriteData();
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: a == null
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
                : SizedBox(child: Consumer<FavoriteProvider>(
                    builder: (_, pragma, __) {
                      return favoriteData.getFavoriteModelData == null
                          ? Center(child: CircularProgressIndicator())
                          : favoriteData.count == 0
                              ? Center(
                                  child: Text(favoriteData.list.message),
                                )
                              : Stack(
                                  children: [
                                    GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.80,
                                        crossAxisSpacing: 4,
                                      ),
                                      itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            Get.to(ShowProductView(
                                              id: pragma.list.data[index].id
                                                  .toString(),
                                            ));
                                          },
                                          child: FlatButton(
                                            padding: EdgeInsets.all(10),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ShowProductView(
                                                            id: pragma.list
                                                                .data[index].id
                                                                .toString(),
                                                          )));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(0, 5),
                                                        color: AppColors.grey
                                                            .withOpacity(0.150),
                                                        blurRadius: 10)
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(children: [
                                                      Container(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            pragma
                                                                .list
                                                                .data[index]
                                                                .imagePath,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            height:
                                                                size.height *
                                                                    0.170,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        top: 0,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 35,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(7.0),
                                                            child: InkWell(
                                                                onTap: () {
                                                                  Provider.of<FavoriteProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .RemoveToFavorite(
                                                                          pragma
                                                                              .list
                                                                              .data[index]
                                                                              .id
                                                                              .toString(),
                                                                          context);
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: AppColors
                                                                      .primary,
                                                                )),
                                                          ),
                                                        ),
                                                      )
                                                    ]),
                                                    Divider(),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      width:
                                                          size.width * 0.3150,
                                                      child: AppText(
                                                        color:
                                                            AppColors.primary,
                                                        text: pragma.list
                                                            .data[index].name,
                                                        fontSize: 3.2,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        AppText(
                                                          text:
                                                              '${pragma.list.data[index].price.toString()}',
                                                          color: Colors.black54,
                                                          fontSize: 3.2,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            AppText(
                                                              text: 'جم',
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 3.1,
                                                            ),
                                                            //   Spacer(),
                                                            SizedBox(
                                                              width:
                                                                  getProportionateScreenWidth(
                                                                      20),
                                                            ),
                                                            AppText(
                                                              text: pragma
                                                                  .list
                                                                  .data[index]
                                                                  .rating,
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 3.1,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: getSizeText(
                                                                  3.5),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                      itemCount: favoriteData.list.data.length,
                                    ),
                                  ],
                                );
                    },
                  )));
  }
}
