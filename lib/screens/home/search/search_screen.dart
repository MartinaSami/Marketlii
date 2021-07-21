import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/search.dart';
import 'package:marketlii/provider/home_providers/favorite_provider.dart';
import 'package:marketlii/provider/search_provider.dart';
import 'package:marketlii/viewmodel/product/item_view.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  test() {
    int i = 0;
    for (i = 0; i < 5; i++) {
      print(i.toString());
    }
    print(i.toString());
  }

  Future df() {}
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<SearchProvider>(context, listen: false);
    categoriesData.callAPIForSearchData(text);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.withOpacity(0.7),
        title: AppText(
          text: 'صفحه البحث',
          fontSize: 3.5,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: TextFormField(
                          onChanged: (valeu) {
                            setState(() {
                              text = valeu;
                            });
                          },
                          autofocus: true,
                          controller: _controller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300])),
                              labelStyle: TextStyle(
                                  color: AppColors.primary, fontSize: 16),
                              labelText: 'بحث')),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeInUp(
                      child: OutlineButton(
                          child: Text('بحث'),
                          onPressed: () {
                            Provider.of<SearchProvider>(context, listen: false)
                                .callAPIForSearchData(_controller.text);
                            setState(() {
                              text = _controller.text;
                            });
                          }),
                    ),
                  ],
                ),
              )),
              text != ''
                  ? Expanded(
                      child: Provider.of<SearchProvider>(context, listen: false)
                                  .getSearchData ==
                              null
                          ? Center(
                              child: SpinKitRotatingCircle(
                              color: AppColors.primary,
                              size: 50.0,
                            ))
                          : SizedBox(child: Consumer<SearchProvider>(
                              builder: (_, pragma, __) {
                                Widget content = Center(
                                    child: Text(pragma.errorMessage != null
                                        ? pragma.errorMessage
                                        : "No Data for you"));
                                if (!pragma.isLoading) {
                                  content =
                                      _buildList(pragma.getSearchData, context);
                                } else if (!pragma.isLoading &&
                                    pragma.getSearchData.Category == null) {
                                  content = Center(
                                      child: Text(pragma.errorMessage != null
                                          ? pragma.errorMessage
                                          : "No Data for you"));
                                } else
                                  content = Center(
                                      child: SpinKitRotatingCircle(
                                    color: AppColors.primary,
                                    size: 50.0,
                                  ));
                                return content;
                              },
                            )),
                    )
                  : Center(child: Text(''))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildList(Search search, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Provider.of<SearchProvider>(context, listen: false).count == 0
      ? Center(
          child: OutlineButton(
            child: Text('no data in ${search.message}'),
          ),
        )
      : GridView.builder(
          padding: EdgeInsets.only(top: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            childAspectRatio: 0.750,
          ),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, int index) {
            return _buildItem(search.data[index], context);
          },
          itemCount: search.data.length,
        );
}

Widget _buildItem(SearchProduct datum, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: FlatButton(
        padding: EdgeInsets.all(7),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ShowProductView(
                        id: datum.id.toString(),
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    color: AppColors.grey.withOpacity(0.150),
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        datum.imagePath,
                        fit: BoxFit.fitWidth,
                        height: size.height * 0.170,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   right: 0,
                  //   top: 0,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 35,
                  //     width: 40,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(100)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(7.0),
                  //       child: InkWell(
                  //           onTap: () {
                  //             if (datum.favorite == '0') {
                  //               Provider.of<FavoriteProvider>(context,
                  //                       listen: false)
                  //                   .AddToFavorite(
                  //                       datum.id.toString(), context);
                  //             } else {
                  //               Provider.of<FavoriteProvider>(context,
                  //                       listen: false)
                  //                   .RemoveToFavorite(
                  //                       datum.id.toString(), context);
                  //             }
                  //           },
                  //           child: datum.favorite == '0'
                  //               ? Icon(
                  //                   Icons.favorite_border,
                  //                   color: AppColors.primary,
                  //                 )
                  //               : Icon(
                  //                   Icons.favorite,
                  //                   color: AppColors.primary,
                  //                 )),
                  //     ),
                  //   ),
                  // )
                ]),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: size.width * 0.3150,
                  child: AppText(
                    color: AppColors.primary,
                    text: datum.name,
                    fontSize: 3.2,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    AppText(
                      text: '${datum.price.toString()}',
                      color: Colors.black54,
                      fontSize: 3.2,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        AppText(
                          text: 'جم',
                          color: Colors.black54,
                          fontSize: 3.1,
                        ),
                        //   Spacer(),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        AppText(
                          text: datum.rating,
                          color: Colors.black54,
                          fontSize: 3.1,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: getSizeText(3.5),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ));
}
