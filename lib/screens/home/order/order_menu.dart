import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/provider/order_provider/orders_provider.dart';
import 'package:marketlii/screens/home/new_order/orderdetails_screen.dart';
import 'package:marketlii/widget/widgets/app_text.dart';
import 'package:provider/provider.dart';

class OrderMenu extends StatefulWidget {
  static const String id = 'OrderMenu';

  @override
  _OrderMenuState createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context, listen: false);
    ordersData.callAPIForOrdersData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0XFF242451),
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/marketlii-topbar.png'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(child: Consumer<OrdersProvider>(
              builder: (_, pragma, __) {
                Widget content = pragma.getOrdersModelData == null
                    ? Center(child: CircularProgressIndicator())
                    : pragma.count == 0
                        ? Center(
                            child: OutlineButton(
                              child: Text('لا يوجد اوردرات'),
                            ),
                          )
                        : ListView.builder(
                            itemCount: pragma.list.data.length,
                            itemBuilder: (_, int i) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 2),
                                              color: AppColors.grey
                                                  .withOpacity(0.3),
                                              blurRadius: 5)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    AppText(
                                                      text: "كود الطلب :",
                                                      color: Colors.grey,
                                                      fontSize: 3.2,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              10),
                                                    ),
                                                    AppText(
                                                      text: pragma.list.data[i]
                                                          .orderCode
                                                          .toString(),
                                                      color: Colors.black,
                                                      fontSize: 3.4,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    AppText(
                                                      text: "وقت الطلب :",
                                                      color: Colors.grey,
                                                      fontSize: 3.2,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              10),
                                                    ),
                                                    AppText(
                                                      text: pragma
                                                          .list.data[i].date
                                                          .toString(),
                                                      color: Colors.black,
                                                      fontSize: 3.4,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          OrderDetailsScreen(
                                                            code: pragma
                                                                .list
                                                                .data[i]
                                                                .orderCode
                                                                .toString(),
                                                          )));
                                            },
                                            child: Container(
                                              width: 60,
                                              height: 65,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.primary,
                                              ),
                                              child: AppText(
                                                textAlign: TextAlign.center,
                                                text: 'تفاصيل الاوردر',
                                                color: Colors.white,
                                                fontSize: 2.8,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            });
                return content;
              },
            )),
          ),
        ],
      ),
    );
  }
}
