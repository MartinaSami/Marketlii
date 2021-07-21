import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget electricBody(context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 40,
      left: 20,
      right: 20,
      bottom: 20,
    ),
    child: Stack(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/laptop.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Toshiba Lap top core i7 - Ram 8G 17 Inc',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0XFF242451),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0XFF242451),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '120EPG',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.favorite_border,
                    ),
                  ],
                ),
              ],
            ),
          ),
          itemCount: 2,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: FloatingActionButton(
            backgroundColor: Color(0XFF242451),
            onPressed: () {},
            child: Icon(Icons.filter_alt),
          ),
        ),
      ],
    ),
  );
}
