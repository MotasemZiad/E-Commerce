import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/add_address.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/delivery_time.dart';
import 'package:e_commerce/view/widget/summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:e_commerce/core/view_model/checkout_view_model.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<CheckoutViewModel>(
  //     init: CheckoutViewModel(),
  //     builder: (controller) => Scaffold(
  //       appBar: AppBar(
  //         centerTitle: true,
  //         backgroundColor: Colors.white,
  //         elevation: 0.0,
  //         title: Text(
  //           "CheckOut",
  //           style: TextStyle(
  //             color: Colors.black,
  //           ),
  //         ),
  //       ),
  //       backgroundColor: Colors.white,
  //       body: Column(
  //         children: [
  //           Container(
  //             height: 100,
  //             child: StatusChange.tileBuilder(
  //               theme: StatusChangeThemeData(
  //                 direction: Axis.horizontal,
  //                 connectorTheme:
  //                     ConnectorThemeData(space: 1.0, thickness: 1.0),
  //               ),
  //               builder: StatusChangeTileBuilder.connected(
  //                 itemWidth: (_) =>
  //                     MediaQuery.of(context).size.width / _processes.length,
  //                 nameWidgetBuilder: (context, index) {
  //                   return Padding(
  //                     padding: const EdgeInsets.only(top: 15.0),
  //                     child: Text(
  //                       _processes[index],
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: controller.getColor(index),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //                 indicatorWidgetBuilder: (_, index) {
  //                   if (index <= controller.processIndex) {
  //                     return DotIndicator(
  //                       size: 35.0,
  //                       border: Border.all(color: Colors.green, width: 1),
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(6.0),
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             color: Colors.green,
  //                           ),
  //                         ),
  //                       ),
  //                     );
  //                   } else {
  //                     return OutlinedDotIndicator(
  //                       size: 30,
  //                       borderWidth: 1.0,
  //                       color: kTodoColor,
  //                     );
  //                   }
  //                 },
  //                 lineWidgetBuilder: (index) {
  //                   if (index > 0) {
  //                     if (index == controller.processIndex) {
  //                       final prevColor = controller.getColor(index - 1);
  //                       final color = controller.getColor(index);
  //                       var gradientColors;
  //                       gradientColors = [
  //                         prevColor,
  //                         Color.lerp(prevColor, color, 0.5)
  //                       ];
  //                       return DecoratedLineConnector(
  //                         decoration: BoxDecoration(
  //                           gradient: LinearGradient(
  //                             colors: gradientColors,
  //                           ),
  //                         ),
  //                       );
  //                     } else {
  //                       return SolidLineConnector(
  //                         color: controller.getColor(index),
  //                       );
  //                     }
  //                   } else {
  //                     return null;
  //                   }
  //                 },
  //                 itemCount: _processes.length,
  //               ),
  //             ),
  //           ),
  //           controller.pages == Pages.DeliveryTime
  //               ? DeliveryTime()
  //               : controller.pages == Pages.AddAddress
  //                   ? AddAddress()
  //                   : Summary(),
  //           Align(
  //             alignment: Alignment.bottomRight,
  //             child: Container(
  //               width: 160.0,
  //               padding: EdgeInsets.all(20.0),
  //               child: CustomButton(
  //                 onPressed: () {
  //                   controller.changeIndex(controller.processIndex + 1);
  //                 },
  //                 text: 'NEXT',
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
