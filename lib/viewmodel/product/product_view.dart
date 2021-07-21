import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/product_model.dart';
import 'package:marketlii/provider/home_providers/favorite_provider.dart';
import 'package:marketlii/provider/home_providers/product.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';
import 'item_view.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoriesData = Provider.of<ProductProvider>(context, listen: false);
    categoriesData.callAPIForProductData();
    return SizedBox(child: Consumer<ProductProvider>(
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
    ));
  }
}

Widget _buildList(ProductModel productModel, BuildContext context) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: .75,
      crossAxisSpacing: 5,
    ),
    itemBuilder: (context, index) =>
        _buildItem(productModel.data[index], context),
    itemCount: 6,
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
              //                   .AddToFavorite(datum.id.toString(), context);
              //             } else {
              //               Provider.of<FavoriteProvider>(context,
              //                       listen: false)
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
  );
}
