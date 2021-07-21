import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/order/order_view.dart';
import 'package:marketlii/view/main_screen.dart';

class DiscountView extends StatelessWidget {
  static const String id = 'DiscountView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF242451),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, OrderScreen.id);
                  }),
              Center(
                child: Text(
                  'مبروك\nكسبت خصم\n20%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'على اي منتج ماركتلي\nالكود',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'MARK20',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/gifts-and-card.png',
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, MainScreen.id),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFF47458),
                    ),
                    width: double.infinity,
                    child: Text(
                      'موافق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
