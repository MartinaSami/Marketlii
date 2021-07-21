import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductsView extends StatelessWidget {
  static const String id = 'ProductsView';
  Color color = Color.fromRGBO(36, 36, 81, 1);
  List<String> text = ['اللابتوب ', 'الموبايل ', 'الاحذيه', 'الساعات'];
  List<String> images = [
    'assets/images/laptop.png',
    'assets/images/phone.png',
    'assets/images/white-shoes.png',
    'assets/images/red-watch.png',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Text(
              'الفئات المعروضه مؤخرا',
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Container(
                padding: EdgeInsets.only(left: 240),
                width: width / 5,
                height: height / 5,
                child: Image.asset(
                  'assets/images/white-shoes.png',
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'الاحذيه',
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' افضل النتجات',
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 17),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .80,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Container(
                child: Column(
                  children: [
                    Image.asset(
                      images[index],
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      text[index].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0XFF242451),
                      ),
                    ),
                    SizedBox(
                      height: 0.5,
                    ),
                  ],
                ),
              ),
              itemCount: images.length,
            ),
          ],
        ),
      ),
    );
  }
}
