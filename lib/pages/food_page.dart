import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialie the selected addons to be false
    for (Addon addon in food.availabeAddons) {
      selectedAddon[addon] = false;
    }
  }

  final Food food;
  final Map<Addon, bool> selectedAddon = {};

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add cart

  void addToCart(Food food, Map<Addon, bool> selectedAddon) {
    // close the current food page to go back to menu
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availabeAddons) {
      if (widget.selectedAddon[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurent>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //food image
                  Image.asset(
                    widget.food.imagePath,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //food name
                        Text(
                          widget.food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        const SizedBox(height: 5),

                        //food price
                        Text(
                          '\$${widget.food.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 5),

                        //food description
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Divider(
                          color: Theme.of(context).colorScheme.secondary,
                        ),

                        Text(
                          'Add-ons',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        //addons
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availabeAddons.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              //get individual addon
                              Addon addon = widget.food.availabeAddons[index];
                              //return checkbox tile UI
                              return CheckboxListTile(
                                title: Text(
                                  addon.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                subtitle: Text(
                                  '\$${addon.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                value: widget.selectedAddon[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddon[addon] = value!;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //add to cart button
                  Mybutton(
                    ontap: () => addToCart(widget.food, widget.selectedAddon),
                    text: 'Add to cart',
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.6,
                child: Container(
                  width: 40,
                  margin: const EdgeInsets.only(left: 25, top: 25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                    ),
                  ),
                ),
              ),

              //Cart button
              Opacity(
                opacity: 0.6,
                child: Container(
                  width: 40,
                  margin: const EdgeInsets.only(right: 25, top: 25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
