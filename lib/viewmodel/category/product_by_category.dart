import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/product_by_category_model.dart';
import 'package:marketlii/provider/childCategories/level_2.dart';
import 'package:marketlii/provider/home_providers/favorite_provider.dart';
import 'package:marketlii/viewmodel/product/item_view.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

class ThirdCategory extends StatefulWidget {
  final String id;
  final String name;

  ThirdCategory({this.id, this.name});

  @override
  _ThirdCategoryState createState() => _ThirdCategoryState();
}

class _ThirdCategoryState extends State<ThirdCategory> {
  @override
  Widget build(BuildContext context) {
    final childCategoryData = Provider.of<LEVEL_2>(context, listen: false);
    childCategoryData.callAPIForChildCategoryData(widget.id);
    Size size = MediaQuery.of(context).size;
    return Container(child: Consumer<LEVEL_2>(
      builder: (_, pragma, __) {
        Widget content = Center(
            child: Text(pragma.errorMessage != null
                ? pragma.errorMessage
                : "No Data for you"));
        if (!pragma.isLoading) {
          content = pragma.getChildCategoryData == null
              ? Center(
                  child: LinearProgressIndicator(),
                )
              : _buildList(pragma.getChildCategoryData, context);
        }
        return content;
      },
    ));
  }
}

Widget _buildList(ProductByCategory category, BuildContext context) {
  return Provider.of<LEVEL_2>(context, listen: false).count == 0
      ? Center(
          child: OutlineButton(
            child: Text('لا يوجد منتجات'),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: category.data.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => _buildItem(
                    product: category.data[index],
                  )),
        );
}

class _buildItem extends StatefulWidget {
  Datum product;
  BuildContext context;

  _buildItem({this.context, this.product});

  @override
  __buildItemState createState() => __buildItemState();
}

class __buildItemState extends State<_buildItem> {
  bool a = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlatButton(
      padding: EdgeInsets.all(7),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ShowProductView(
                      id: widget.product.id.toString(),
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
                      widget.product.imagePath,
                      fit: BoxFit.fitWidth,
                      height: size.height * 0.170,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: InkWell(
                          onTap: () {
                            if (widget.product.favorite == '0') {
                              Provider.of<FavoriteProvider>(context,
                                      listen: false)
                                  .AddToFavorite(
                                      widget.product.id.toString(), context);
                            } else {
                              Provider.of<FavoriteProvider>(context,
                                      listen: false)
                                  .RemoveToFavorite(
                                      widget.product.id.toString(), context);
                            }
                          },
                          child: widget.product.favorite == '0'
                              ? Icon(
                                  Icons.favorite_border,
                                  color: AppColors.primary,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: AppColors.primary,
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
                width: size.width * 0.3150,
                child: AppText(
                  color: AppColors.primary,
                  text: widget.product.name,
                  fontSize: 3.2,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  AppText(
                    text: '${widget.product.price.toString()}',
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
                        text: widget.product.rating,
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
}
