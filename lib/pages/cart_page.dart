import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurent>(
      builder: (context, restaurent, child) {
        //cart
        final userCart = restaurent.cart;

        //scaffold UI

        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Are you sure, you want to clear the cart?',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        actions: [
                          //cancel button
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          //Yes button
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurent.clearCart();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //List of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 35,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Cart is empty..',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];

                                //return carttile UI
                                return CartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              //Button to pay
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Mybutton(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      );
                    },
                    text: 'Checkout'),
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
