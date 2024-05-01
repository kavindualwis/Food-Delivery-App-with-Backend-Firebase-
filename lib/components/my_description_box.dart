import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //textstyle
    var myPrimaryTextColor =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextColor =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text(
                '\$0.99',
                style: myPrimaryTextColor,
              ),
              Text(
                'Delivery fee',
                style: mySecondaryTextColor,
              ),
            ],
          ),
          //Delivery time
          Column(
            children: [
              Text(
                '15 - 30 min',
                style: myPrimaryTextColor,
              ),
              Text(
                'Delivery time',
                style: mySecondaryTextColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
