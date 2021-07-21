import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/categroy_model.dart';
import 'package:marketlii/provider/home_providers/category/sup_category.dart';
import 'package:marketlii/viewmodel/category/level_2.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

class SupCategroyView extends StatefulWidget {
  String id;
  String name;
  SupCategroyView({this.id, this.name});
  @override
  _SupCategroyViewState createState() => _SupCategroyViewState();
}

class _SupCategroyViewState extends State<SupCategroyView> {
  String i;

  @override
  void initState() {
    setState(() {
      i = widget.id;
      print('level 1 $i');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var categoriesData =
        Provider.of<SupCategoryProvider>(context, listen: false);
    categoriesData.level1(i);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: AppColors.primary.withOpacity(0.3),
      ),
      body: SafeArea(
        child: SizedBox(child: Consumer<SupCategoryProvider>(
          builder: (_, pragma, __) {
            Widget content = Center(
                child: Text(pragma.errorMessage != null
                    ? pragma.errorMessage
                    : "No Data for you"));
            if (!pragma.isLoading) {
              content =
                  _buildList(pragma.getSupCategoryData, context, widget.id);
            } else if (!pragma.isLoading &&
                pragma.getSupCategoryData.Category == null) {
              content = Center(
                  child: Text(pragma.errorMessage != null
                      ? pragma.errorMessage
                      : "No Data for you"));
            } else
              content = LinearProgressIndicator();
            return content;
          },
        )),
      ),
    );
  }
}

Widget _buildList(Category category, BuildContext context, String id) {
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Provider.of<SupCategoryProvider>(context, listen: false).count != 0
          ? Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return _buildItem(category.data[index], context);
                  },
                  itemCount: category.data.length,
                ),
              ),
            )
          : Center(
              child: OutlineButton(
                child: Text('لا يوجد عناصر'),
              ),
            ),
    ],
  );
}

Widget _buildItem(CategoryDatum categoryDatum, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return FlatButton(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SupOfCategroyView(
                    id: categoryDatum.id.toString(),
                    name: categoryDatum.name,
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
              text: categoryDatum.name,
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
                child: Image.network(categoryDatum.imagePath),
              ))
        ],
      ),
    ),
  );
}
