import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_radio_list_tile.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.0,
          ),
          CustomRadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (value) {
              setState(() {
                delivery = value;
              });
            },
            title: 'Standard Delivery',
            subtitle: '\nOrder will be delivered between 3 - 5 business days',
          ),
          SizedBox(
            height: 25.0,
          ),
          CustomRadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (value) {
              setState(() {
                delivery = value;
              });
            },
            title: 'Next Day Delivery',
            subtitle:
                '\nPlace your order before 6pm and your items will be delivered the next day',
          ),
          SizedBox(
            height: 25.0,
          ),
          CustomRadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (value) {
              setState(() {
                delivery = value;
              });
            },
            title: 'Nominated Delivery',
            subtitle:
                '\nPick a particular date from the calendar and order will be delivered on selected date',
          ),
        ],
      ),
    );
  }
}
