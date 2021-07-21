import 'package:flutter/material.dart';
import '../size_config.dart';
import '../constants.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "هل لديك حساب؟",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(

                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Come soon',textAlign: TextAlign.center,),
                        IconButton(icon: Icon(Icons.clear),onPressed: (){Navigator.pop(context);},)
                      ],
                    ),
                  ),
                );
              }),
          child: Text(
            "انشاء حساب",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
