import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyRecipt extends StatefulWidget {
  const MyRecipt({super.key});

  @override
  State<MyRecipt> createState() => _MyReciptState();
}

class _MyReciptState extends State<MyRecipt> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25, bottom: 25, top: 25),
      child: Center(
        child: Column(
          children: [
            const Text(
              "Thank you for your order!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Consumer<Restaurent>(
                builder: (context, restaurent, child) => Text(
                  restaurent.displayCartRecipt(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Estimated delivery time is: 3.15 PM",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
