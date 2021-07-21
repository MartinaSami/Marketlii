import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/categroy_model.dart';
import 'package:marketlii/provider/childCategories/leve_3.dart';
import 'package:marketlii/viewmodel/category/level_4.dart';
import 'package:marketlii/viewmodel/category/product_by_category.dart';
import 'package:provider/provider.dart';

class SupOf3CategroyView extends StatefulWidget {
  String id;
  String name;
  SupOf3CategroyView({this.id, this.name});
  @override
  _SupOf3CategroyViewState createState() => _SupOf3CategroyViewState();
}

class _SupOf3CategroyViewState extends State<SupOf3CategroyView> {
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
    var categoriesData = Provider.of<LEVEL_3>(context, listen: false);
    categoriesData.callAPIForChildCategoryData(i);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: AppColors.primary.withOpacity(0.3),
      ),
      body: SafeArea(
        child: SizedBox(child: Consumer<LEVEL_3>(
          builder: (_, pragma, __) {
            Widget content = Center(
                child: Text(pragma.errorMessage != null
                    ? pragma.errorMessage
                    : "No Data for you"));
            if (!pragma.isLoading) {
              content =
                  _buildList(pragma.getChildCategoryData, context, widget.id);
            } else if (!pragma.isLoading &&
                pragma.getChildCategoryData.Category == null) {
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
    children: [
      Expanded(
        child: Container(
          child: ThirdCategory(
            id: id,
            name: 'osama',
          ),
        ),
      ),
    ],
  );
}

Widget _buildItem(CategoryDatum categoryDatum, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return FlatButton(
    padding: EdgeInsets.all(2),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SupOf4CategroyView(
                    id: categoryDatum.id.toString(),
                  )));
    },
    child: Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          height: 100,
          width: 100,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/watch.png',
                  width: 80,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff34283E).withOpacity(0.60)),
              ),
              Center(
                child: Text(
                  categoryDatum.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        )),
  );
}
