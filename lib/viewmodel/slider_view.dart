import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/provider/home_providers/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderView extends StatefulWidget {
  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    var sliderData = Provider.of<SliderProvider>(context, listen: false);
    sliderData.callAPIForSliderData();
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.16,
        child: Consumer<SliderProvider>(
          builder: (_, pragma, __) {
            return sliderData.getSliderData == null
                ? Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[200],
                  )
                : SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Carousel(
                      
                      animationDuration: Duration(seconds: 3),
                      //   animationDuration: Duration(seconds: 3),
                      images: [
                        for (int i = 0; i < pragma.list.data.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network(
                                pragma.list.data[i].imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: Colors.white,
                      indicatorBgPadding: 10,
                      dotBgColor: Colors.white.withOpacity(0),
                      borderRadius: true,
                    ),
                  );
          },
        ));
  }
}
