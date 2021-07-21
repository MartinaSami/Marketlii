import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/categroy_model.dart';
import 'package:marketlii/provider/home_providers/category/categroy.dart';
import 'package:marketlii/viewmodel/category/level_1.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    var categoriesData = Provider.of<CategoryProvider>(context, listen: false);
    categoriesData.callAPIForCategoryData();
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.13,
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
        ));
  }
}

Widget _buildList(Category category, BuildContext context) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index) => _buildItem(category.data[index], context),
    itemCount: category.data.length,
  );
}

Widget _buildItem(CategoryDatum category, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return FlatButton(
      padding: EdgeInsets.only(right: 10),
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
        decoration: BoxDecoration(
            color: AppColors.wight,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: AppColors.grey.withOpacity(0.150),
                  blurRadius: 10)
            ]),
        // height: size.height * 0.30,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: size.width * 0.2,
                height: size.height * 0.08,
                child: Center(
                  child: Image.network(
                    category.imagePath,
                    //height: size.height * 0.4,
                    // width: size.width * 0.3,
                  ),
                ),
              ),
              AppText(
                textAlign: TextAlign.center,
                text: category.name,
                fontSize: 3.3,
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ));
}
