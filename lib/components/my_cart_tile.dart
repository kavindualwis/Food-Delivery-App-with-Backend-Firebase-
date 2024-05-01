// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(
      builder: (context, restaurent, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Food details
                  Expanded(
                    child: Row(
                      children: [
                        // Food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Name and price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name
                              Text(
                                overflow: TextOverflow.clip,
                                cartItem.food.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              // Price
                              Text(
                                '\$${cartItem.food.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Quantity Selector
                  QuantitySelector(
                    food: cartItem.food,
                    quantity: cartItem.quantity,
                    onIncrement: () {
                      restaurent.addToCart(
                          cartItem.food, cartItem.selectedAddon);
                    },
                    onDecrement: () {
                      restaurent.removeFromCart(cartItem);
                    },
                  ),
                ],
              ),

              //addons
              SizedBox(
                height: cartItem.selectedAddon.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  children: cartItem.selectedAddon
                      .map((addon) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Row(
                                children: [
                                  //name
                                  Text(addon.name),
                                  const SizedBox(width: 5),

                                  //price
                                  Text('(\$${addon.price})'),
                                ],
                              ),
                              shape: StadiumBorder(
                                  side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              )),
                              onSelected: (value) {},
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              labelStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
