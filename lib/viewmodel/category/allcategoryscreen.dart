import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/categroy_model.dart';
import 'package:marketlii/provider/home_providers/category/categroy.dart';
import 'package:marketlii/viewmodel/category/level_1.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AllCategoryScreen extends StatefulWidget {
  //static const String id = 'ProductsView';

  @override
  _AllCategoryScreenState createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var categoriesData = Provider.of<CategoryProvider>(context, listen: false);
    categoriesData.callAPIForCategoryData();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.primary.withOpacity(0.3),
        title: FadeInLeft(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'كل العناصر',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
            child: Column(
          children: [
            Expanded(
              child: Consumer<CategoryProvider>(
                builder: (_, pragma, __) {
                  Widget content = Center(
                      child: Text(pragma.errorMessage != null
                          ? pragma.errorMessage
                          : "No Data for you"));
                  if (!pragma.isLoading) {
                    content = pragma.getCategoryData == null
                        ? Center(child: CircularProgressIndicator())
                        : _buildList(pragma.getCategoryData, context);
                  } else if (!pragma.isLoading &&
                      pragma.getCategoryData.Category == null) {
                    content = Center(
                        child: Text(pragma.errorMessage != null
                            ? pragma.errorMessage
                            : "No Data for you"));
                  } else
                    content = Center(child: CircularProgressIndicator());
                  return content;
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

Widget _buildList(Category homeCategory, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return ListView.builder(
    padding: EdgeInsets.all(0),
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemBuilder: (_, int index) {
      return _buildItem(homeCategory.data[index], context);
    },
    itemCount: homeCategory.data.length,
  );
}

Widget _buildItem(CategoryDatum category, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return FlatButton(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SupCategroyView(
                    id: category.id.toString(),
                    name: category.name,
                  )));
    },
    child: Container(
      height: size.height * 0.1,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.2)),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AppText(
              text: category.name,
              fontSize: 3.6,
              color: Colors.black,
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(category.imagePath),
              ))
        ],
      ),
    ),
  );
}
