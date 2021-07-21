import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/provider/reta_provider.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';

class AllRate extends StatefulWidget {
  String id;
  int count;
  bool scrol = false;
  AllRate({this.count, this.scrol, this.id});
  @override
  _AllRateState createState() => _AllRateState();
}

class _AllRateState extends State<AllRate> {
  @override
  Widget build(BuildContext context) {
    var rateData = Provider.of<RateProvider>(context);
    rateData.callAPIForRateData(widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.withOpacity(0.5),
        title: Text('كل التقيمات'),
      ),
      body: SafeArea(
        child: Consumer<RateProvider>(builder: (_, data, __) {
          return data.getUserModelData == null
              ? Container()
              : data.count == 0
                  ? Center(
                      child: OutlineButton(
                        child: Text('لا يوجد تقيمات علي هذا المنتج'),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(0),
                      physics: widget.scrol == null
                          ? NeverScrollableScrollPhysics()
                          : BouncingScrollPhysics(),
                      itemCount: widget.count == null
                          ? data.list.data.length
                          : widget.count,
                      itemBuilder: (_, int i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 7,
                                      color: Colors.grey[200])
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppText(
                                        text: data.list.data[i].name,
                                        color: Colors.black54,
                                        fontSize: 3.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Row(
                                        children: [
                                          AppText(
                                            text: data.list.data[i].createdAt
                                                .toString(),
                                            color: Colors.grey,
                                            fontSize: 3.1,
                                          ),
                                          Icon(
                                            Icons.timelapse_outlined,
                                            color: Colors.grey,
                                            size: getSizeText(3.5),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(5),
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(
                                                data.list.data[i].rate),
                                            minRating: 1,
                                            itemSize: getSizeText(3.4),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      AppText(
                                        text: data.list.data[i].content,
                                        color: Colors.black54,
                                        fontSize: 3.2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
        }),
      ),
    );
  }
}
