import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/product_model.dart';
import 'package:marketlii/provider/home_providers/favorite_provider.dart';
import 'package:marketlii/provider/home_providers/product.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';
import 'item_view.dart';

class AllProductView extends StatefulWidget {
  @override
  _AllProductViewState createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoriesData = Provider.of<ProductProvider>(context, listen: false);
    categoriesData.callAPIForProductData();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.primary.withOpacity(0.3),
        title: FadeInLeft(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'كل المنتجات',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(child: Consumer<ProductProvider>(
        builder: (_, pragma, __) {
          Widget content = Center(
              child: Text(pragma.errorMessage != null
                  ? pragma.errorMessage
                  : "No Data for you"));
          if (!pragma.isLoading) {
            content = pragma.getProductData == null
                ? Center(child: CircularProgressIndicator())
                : _buildList(pragma.getProductData, context);
          } else if (!pragma.isLoading &&
              pragma.getProductData.Category == null) {
            content = Center(
                child: Text(pragma.errorMessage != null
                    ? pragma.errorMessage
                    : "No Data for you"));
          } else
            content = Center(child: CircularProgressIndicator());
          return content;
        },
      )),
    );
  }
}

Widget _buildList(ProductModel productModel, BuildContext context) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: .70,
      crossAxisSpacing: 20,
    ),
    itemBuilder: (context, index) =>
        _buildItem(productModel.data[index], context),
    itemCount: productModel.data.length,
  );
}

Widget _buildItem(Datum datum, BuildContext context) {
  bool a = false;
  Size size = MediaQuery.of(context).size;
  return FlatButton(
    padding: EdgeInsets.all(7),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ShowProductView(
                    id: datum.id.toString(),
                  )));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                datum.imagePath,
                fit: BoxFit.cover,
                height: size.height * 0.170,
              ),
            ),
            Positioned(
                right: 0,
                child: datum.favorite != '0'
                    ? Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.9),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: AppText(
                          text: '25%',
                          fontSize: 3.5,
                          color: Colors.white,
                        ),
                      )
                    : Text('')),
            // Positioned(
            //   right: 7,
            //   bottom: 0,
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
            //               Provider.of<FavoriteProvider>(context, listen: false)
            //                   .AddToFavorite(datum.id.toString(), context);
            //             } else {
            //               Provider.of<FavoriteProvider>(context, listen: false)
            //                   .RemoveToFavorite(datum.id.toString(), context);
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: size.height * 0.018,
                  initialRating: double.parse(datum.rating),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: size.height * 0.012,
                  ),
                  // onRatingUpdate: (rating) {
                  //   print(rating);
                  // },
                )
              ],
            ),
            Container(
              width: size.width * 0.3150,
              child: AppText(
                color: Colors.black45,
                text: datum.name,
                fontSize: 3.5,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                AppText(
                  text: '${datum.price.toString()}',
                  color: AppColors.primary,
                  fontSize: 3.5,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 5,
                ),
                AppText(
                  text: 'EGP',
                  color: AppColors.primary,
                  fontSize: 3.5,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
