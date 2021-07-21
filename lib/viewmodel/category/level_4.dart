import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/model/categroy_model.dart';
import 'package:marketlii/provider/childCategories/leve_3.dart';
import 'package:marketlii/provider/childCategories/level_4.dart';
import 'package:marketlii/viewmodel/category/product_by_category.dart';
import 'package:provider/provider.dart';

class SupOf4CategroyView extends StatefulWidget {
  String id;
  SupOf4CategroyView({this.id});
  @override
  _SupOf4CategroyViewState createState() => _SupOf4CategroyViewState();
}

class _SupOf4CategroyViewState extends State<SupOf4CategroyView> {
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
    var categoriesData = Provider.of<LEVEL_4>(context, listen: false);
    categoriesData.callAPIForChildCategoryData(i);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(child: Consumer<LEVEL_4>(
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
              content = Center(child: CircularProgressIndicator());
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
      Provider.of<LEVEL_3>(context, listen: false).count == 0
          ? Container()
          : Container(
              height: size.height * 0.1,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _buildItem(category.data[index], context);
                },
                itemCount: category.data.length,
              ),
            ),
      Divider(),
      Container(
        height: size.height * 0.5,
        child: ThirdCategory(
          id: id,
          name: 'osama',
        ),
      )
    ],
  );
}

Widget _buildItem(CategoryDatum categoryDatum, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return FlatButton(
    padding: EdgeInsets.all(2),
    onPressed: () {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => SupCategroyView(
      //           id: categoryDatum.id.toString(),
      //         )));
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
