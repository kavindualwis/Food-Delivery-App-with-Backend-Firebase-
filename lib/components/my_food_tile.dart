import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                //text food details

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        '\$ ${food.price}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: Object(),
                    child: Image.asset(
                      food.imagePath,
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          indent: 25,
          endIndent: 25,
        ),
      ],
    );
  }
}
