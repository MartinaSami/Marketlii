// import 'package:flutter/material.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stock_store/providers/cart/cart_provider.dart';
// import 'package:stock_store/theme/app_colors.dart';
// import 'package:stock_store/widgets/app_text.dart';
// import 'package:stock_store/widgets/widgets.dart';
//
// class CheckOut extends StatefulWidget {
//   String total;
//
//   CheckOut({this.total});
//
//   @override
//   _CheckOutState createState() => _CheckOutState();
// }
//
// class _CheckOutState extends State<CheckOut> {
//   String City = '1';
//   String time = '0';
//   TextEditingController city = new TextEditingController();
//   TextEditingController st_num = new TextEditingController();
//   TextEditingController building_num = new TextEditingController();
//   TextEditingController floor_num = new TextEditingController();
//   TextEditingController location_type = new TextEditingController();
//   TextEditingController shippimg_note = new TextEditingController();
//   TextEditingController shipping_time = new TextEditingController();
//   TextEditingController shipping_cost = new TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BottomSheet(
//       builder: (_) {
//         return SingleChildScrollView(
//           child: Container(
//             color: Colors.black54,
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         offset: Offset(0, -5),
//                         blurRadius: 15,
//                         color: Colors.grey.withOpacity(0.1))
//                   ],
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25))),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Column(
//                   children: [
//                     SingleChildScrollView(
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   flex: 1,
//                                   child: new DropdownButton<String>(
//                                     iconEnabledColor: AppColors.yellow,
//                                     value: City,
//                                     items: <String>[
//                                       '1',
//                                       '2',
//                                       '3',
//                                       '4'
//                                     ].map((String value) {
//                                       return new DropdownMenuItem<String>(
//                                         value: value,
//                                         child: new Text(value),
//                                       );
//                                     }).toList(),
//                                     onChanged: (value) {
//                                       setState(() {
//                                         City = value;
//                                         time = '45';
//                                       });
//                                       print(value);
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Expanded(
//                                     flex: 3,
//                                     child: TextFieldWidget(
//                                       name: "State",
//                                       controller: st_num,
//                                     )),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                     flex: 3,
//                                     child: TextFieldWidget(
//                                       name: 'Building',
//                                       controller: building_num,
//                                     )),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Expanded(
//                                     flex: 3,
//                                     child: TextFieldWidget(
//                                       name: "floor",
//                                       controller: floor_num,
//                                     )),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             TextFieldWidget(
//                               name: "location",
//                               controller: location_type,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             TextFieldWidget(
//                               name: "Shippimg Note",
//                               controller: shippimg_note,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   translator.translate('shipping'),
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   width: 30,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     City == '' ? '0' : '${GetShappingAndTime(City)}',
//                                     style: TextStyle(
//                                         fontSize: 19,
//                                         color: Colors.black54,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   translator.translate('total'),
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   width: 30,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     Provider.of<CartProvider>(context,
//                                                     listen: false)
//                                                 .count ==
//                                             0
//                                         ? '0'
//                                         : '\$${widget.total}',
//                                     style: TextStyle(
//                                         fontSize: 19,
//                                         color: Colors.black54,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 7,
//                             ),
//                             FlatButton(
//                               padding: EdgeInsets.all(0),
//                               onPressed: () async {
//                                 SharedPreferences sharedPreferences =
//                                     await SharedPreferences.getInstance();
//                                 String token =
//                                     sharedPreferences.getString('token');
//                                 String lang =
//                                     sharedPreferences.getString('token');
//                                 Provider.of<CartProvider>(context,
//                                     listen: false)
//                                     .checkOut(
//                                     'ar',
//                                     city.text,
//                                     st_num.text,
//                                     building_num.text,
//                                     floor_num.text,
//                                     location_type.text,
//                                     shippimg_note.text,
//                                     time,
//                                     '1',
//                                     'dasd',
//                                     token);
//                                 try {
//                                   if (_formKey.currentState.validate()) {
//                                     _formKey.currentState.save();
//                                     Provider.of<CartProvider>(context,
//                                             listen: false)
//                                         .checkOut(
//                                             'ar',
//                                             city.text,
//                                             st_num.text,
//                                             building_num.text,
//                                             floor_num.text,
//                                             location_type.text,
//                                             shippimg_note.text,
//                                             time,
//                                             City,
//                                             'dsad',
//                                             token);
//                                     Navigator.pop(context);
//                                   }
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 50,
//                                 width: size.width,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: AppColors.yellow),
//                                 child: AppText(
//                                   text: 'Check Out',
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       onClosing: () {},
//     );
//   }
// }
//
// // ignore: must_be_immutable
// class TextFieldWidget extends StatelessWidget {
//   TextEditingController controller;
//   String name;
//
//   TextFieldWidget({this.controller, this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       alignment: Alignment.center,
//       child: TextFormField(
//           controller: controller,
//           validator: (value) {
//             if (value.isEmpty) {
//               return "";
//             }
//             return null;
//           },
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//             ),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide(color: Colors.grey[300])),
//             labelStyle: TextStyle(color: AppColors.yellow, fontSize: 16),
//             labelText: translator.translate(name),
//           )),
//     );
//   }
// }
// GetShappingAndTime(String num){
//  switch(num){
//    case '1' : return '+10' ;break;
//    case '2' : return '+20' ;
// }
// }
