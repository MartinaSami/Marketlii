import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/model/orderdetails_model.dart';
import 'package:marketlii/provider/order_provider/orderdetails_provider.dart';
import 'package:marketlii/provider/order_provider/orders_provider.dart';

import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  String code;

  OrderDetailsScreen({this.code});

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orderdetailsData =
        Provider.of<OrderDetailsProvider>(context, listen: false);
    orderdetailsData.callAPIForOrdersData(widget.code);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () {
          print(widget.code);
          Provider.of<OrdersProvider>(context, listen: false)
              .removeOrder(widget.code);
        },
      ),
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(child: Consumer<OrderDetailsProvider>(
                builder: (_, pragma, __) {
                  return orderdetailsData.getOrdersModelData == null
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          AppText(
                                            text: 'الكمية :',
                                            fontSize: 3.2,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: AppColors.primary
                                                    .withOpacity(0.2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: AppText(
                                                text: orderdetailsData
                                                    .list.data.products.length
                                                    .toString(),
                                                fontSize: 3.4,
                                                color: AppColors.wight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          AppText(
                                            text: 'الكود',
                                            fontSize: 3.5,
                                            color: AppColors.grey,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: AppText(
                                              text:
                                                  '#${orderdetailsData.list.data.orderCode}',
                                              fontSize: 3.5,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              color: AppColors.primary,
                                              size: getSizeText(4.2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'العنوان :',
                                        fontSize: 3.2,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: AppText(
                                              text: orderdetailsData
                                                  .list.data.address
                                                  .toString(),
                                              fontSize: 3.4,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Icon(Icons.location_on_outlined),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: AppColors.yellow,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: ListView.builder(
                                    padding: EdgeInsets.only(top: 15),
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (_, int index) {
                                      return _buildItem(
                                          orderdetailsData
                                              .list.data.products[index],
                                          context);
                                    },
                                    itemCount: orderdetailsData
                                        .list.data.products.length),
                              ),
                            ),
                          ],
                        );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildItem(OrderProduct product, BuildContext context) {
  double s = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Column(
      children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    color: AppColors.grey.withOpacity(0.3),
                    blurRadius: 5)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                    )),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.450,
                    child: AppText(
                      text: product.name,
                      color: Colors.black,
                      fontSize: 3.5,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: '${product.price.toString()}',
                        color: AppColors.yellow,
                        fontSize: 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: 'EGP',
                        color: AppColors.primary,
                        fontSize: 3.2,
                      ),
                    ],
                  ),
                  AppText(
                    text: '\X ${product.quantity.toString()}',
                    color: AppColors.grey,
                    fontSize: 3.2,
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    ),
  );
}
