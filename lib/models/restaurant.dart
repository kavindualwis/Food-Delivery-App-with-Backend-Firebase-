import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurent extends ChangeNotifier {
  //list of food menu

  final List<Food> _menu = [
    //burgers

    Food(
      name: "Classic Cheeseburger",
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion pickel ',
      imagePath: 'images/Burgers/burger6.jpg',
      price: 7.99,
      category: FoodCategory.burgers,
      availabeAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Extra Patty', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Double Mushroom Swiss Burger",
      description:
          'Two succulent beef patties topped with sautéed mushrooms, melted Swiss cheese, lettuce, tomato, and a dollop of mayo.',
      imagePath: 'images/Burgers/burger2.jpg',
      price: 6.99,
      category: FoodCategory.burgers,
      availabeAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Extra Patty', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Classic Bacon Cheeseburger",
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion pickel ',
      imagePath: 'images/Burgers/burger3.jpg',
      price: 9.99,
      category: FoodCategory.burgers,
      availabeAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Extra Patty', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Spicy Jalapeño Pepper Jack Burger",
      description:
          'A spicy beef patty with pepper jack cheese, sliced jalapeños, lettuce, tomato, and a zesty chipotle mayo.',
      imagePath: 'images/Burgers/burger2.jpg',
      price: 5.79,
      category: FoodCategory.burgers,
      availabeAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Extra Patty', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Southwestern Veggie Burger",
      description:
          'A hearty black bean patty topped with melted cheddar cheese, fresh salsa, avocado slices, lettuce, and tomato.',
      imagePath: 'images/Burgers/burger5.jpg',
      price: 9.29,
      category: FoodCategory.burgers,
      availabeAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Extra Patty', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),

    //salads

    Food(
      name: "Classic Caesar Salad",
      description:
          'Crisp romaine lettuce tossed in creamy Caesar dressing, topped with grated Parmesan cheese, crunchy croutons, and grilled chicken strips.',
      imagePath: 'images/Salads/salad1.jpg',
      price: 6.99,
      category: FoodCategory.salads,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Mediterranean Quinoa Salad",
      description:
          'A refreshing blend of quinoa, diced cucumbers, cherry tomatoes, Kalamata olives, feta cheese, and red onion, drizzled with lemon vinaigrette.',
      imagePath: 'images/Salads/salad2.jpg',
      price: 7.49,
      category: FoodCategory.salads,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Asian Sesame Chicken Salad",
      description:
          'Mixed greens topped with tender slices of grilled chicken, mandarin oranges, sliced almonds, crispy wonton strips, and sesame ginger dressing.',
      imagePath: 'images/Salads/salad3.jpg',
      price: 8.29,
      category: FoodCategory.salads,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Caprese Salad",
      description:
          'Slices of ripe tomatoes and fresh mozzarella cheese layered with basil leaves, drizzled with balsamic glaze and extra virgin olive oil.',
      imagePath: 'images/Salads/salad4.jpeg',
      price: 6.79,
      category: FoodCategory.salads,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Thai Peanut Noodle Salad",
      description:
          'A vibrant mix of mixed greens, rice noodles, shredded carrots, red cabbage, chopped peanuts, and cilantro, tossed in a creamy Thai peanut dressing.',
      imagePath: 'images/Salads/salad5.jpeg',
      price: 7.99,
      category: FoodCategory.salads,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),

    //sides

    Food(
      name: "Crispy Garlic Parmesan Fries",
      description:
          'Golden fries tossed in garlic butter and sprinkled with grated Parmesan cheese and chopped parsley.',
      imagePath: 'images/Sides/side1.jpg',
      price: 3.49,
      category: FoodCategory.sides,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Loaded Sweet Potato Wedges",
      description:
          'Roasted sweet potato wedges topped with melted cheddar cheese, crispy bacon bits, green onions, and a drizzle of sour cream.',
      imagePath: 'images/Sides/side2.jpg',
      price: 4.29,
      category: FoodCategory.sides,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Garlic Herb Butter Corn",
      description:
          ' Fresh corn on the cob smothered in garlic herb butter and sprinkled with chopped fresh herbs.',
      imagePath: 'images/Sides/side3.jpg',
      price: 2.99,
      category: FoodCategory.sides,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Crispy Onion Rings",
      description:
          'Thick-cut onion rings coated in a crispy batter, served with a side of tangy barbecue sauce for dipping.',
      imagePath: 'images/Sides/side4.jpg',
      price: 3.99,
      category: FoodCategory.sides,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),
    Food(
      name: "Crispy Brussels Sprouts",
      description:
          'Roasted Brussels sprouts tossed in a balsamic glaze and sprinkled with crispy bacon bits and shaved Parmesan cheese.',
      imagePath: 'images/Sides/side5.jpg',
      price: 4.49,
      category: FoodCategory.sides,
      availabeAddons: [
        Addon(name: 'Grilled Shrimp', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.99),
        Addon(name: 'Avacado', price: 2.99),
      ],
    ),

    //desserts
    Food(
      name: "Classic New York Cheesecake",
      description:
          'Creamy and rich cheesecake on a graham cracker crust, served plain or with your choice of raspberry or strawberry topping.',
      imagePath: 'images/Desserts/deseert1.jpg',
      price: 5.99,
      category: FoodCategory.desserts,
      availabeAddons: [
        Addon(name: 'Whipped Cream', price: 0.99),
        Addon(name: 'Chocolate Sauce', price: 1.99),
        Addon(name: 'Fresh Berries', price: 2.99),
      ],
    ),
    Food(
      name: "Decadent Chocolate Lava Cake",
      description:
          'Warm chocolate cake with a gooey molten center, served with a scoop of vanilla ice cream and a drizzle of chocolate sauce.',
      imagePath: 'images/Desserts/deseert2.jpg',
      price: 6.49,
      category: FoodCategory.desserts,
      availabeAddons: [
        Addon(name: 'Caramel Sauce', price: 0.99),
        Addon(name: 'Crushed Nuts', price: 1.99),
        Addon(name: 'Raspberry Coulis', price: 2.99),
      ],
    ),
    Food(
      name: "Homemade Apple Pie",
      description:
          'A flaky, golden crust filled with cinnamon-spiced apples, served warm and topped with a scoop of vanilla ice cream.',
      imagePath: 'images/Desserts/deseert3.jpg',
      price: 5.79,
      category: FoodCategory.desserts,
      availabeAddons: [
        Addon(name: 'Caramel Drizzle', price: 0.99),
        Addon(name: 'Whipped Cream', price: 1.99),
        Addon(name: 'Streusel Topping', price: 2.99),
      ],
    ),
    Food(
      name: "Refreshing Lemon Sorbet",
      description:
          'Tangy and refreshing lemon sorbet served in a chilled glass, garnished with a twist of lemon zest.',
      imagePath: 'images/Desserts/deseert4.jpg',
      price: 4.29,
      category: FoodCategory.desserts,
      availabeAddons: [
        Addon(name: 'Fresh Mint Leaves', price: 0.99),
        Addon(name: 'Mixed Berry Compote', price: 1.99),
        Addon(name: 'Shortbread Cookies', price: 2.99),
      ],
    ),
    Food(
      name: "Indulgent Tiramisu",
      description:
          'Layers of espresso-soaked ladyfingers and creamy mascarpone cheese, dusted with cocoa powder and served chilled.',
      imagePath: 'images/Desserts/deseert5.jpg',
      price: 5.99,
      category: FoodCategory.desserts,
      availabeAddons: [
        Addon(name: 'Chocolate Shavings', price: 0.99),
        Addon(name: 'Amaretto Drizzle', price: 1.99),
        Addon(name: 'Espresso Shot', price: 2.99),
      ],
    ),

    //drinks

    Food(
      name: "Classic Mojito",
      description:
          'A refreshing mix of white rum, fresh lime juice, mint leaves, simple syrup, and soda water, served over ice.',
      imagePath: 'images/Drinks/drink1.jpg',
      price: 7.49,
      category: FoodCategory.drinks,
      availabeAddons: [
        Addon(name: 'Extra Lime Wedges', price: 0.99),
        Addon(name: 'Fresh Mint Sprig', price: 1.99),
        Addon(name: 'Flavored Syrup', price: 2.99),
      ],
    ),
    Food(
      name: "Frozen Strawberry Daiquiri",
      description:
          'A blended concoction of rum, fresh strawberries, lime juice, and simple syrup, served in a chilled glass with a sugar rim.',
      imagePath: 'images/Drinks/drink2.jpg',
      price: 8.29,
      category: FoodCategory.drinks,
      availabeAddons: [
        Addon(name: 'Pineapple Garnish', price: 0.99),
        Addon(name: 'Coconut Cream', price: 1.99),
        Addon(name: 'Whipped Cream', price: 2.99),
      ],
    ),
    Food(
      name: "Classic Mojito",
      description:
          'A refreshing mix of white rum, fresh lime juice, mint leaves, simple syrup, and soda water, served over ice.',
      imagePath: 'images/Drinks/drink3.jpg',
      price: 7.49,
      category: FoodCategory.drinks,
      availabeAddons: [
        Addon(name: 'Extra Lime Wedges', price: 0.99),
        Addon(name: 'Fresh Mint Sprig', price: 1.99),
        Addon(name: 'Flavored Syrup', price: 2.99),
      ],
    ),
    Food(
      name: "Iced Caramel Macchiato",
      description:
          'Chilled espresso with creamy milk and sweet caramel syrup, served over ice and topped with a drizzle of caramel sauce.',
      imagePath: 'images/Drinks/drink4.jpg',
      price: 7.49,
      category: FoodCategory.drinks,
      availabeAddons: [
        Addon(name: 'Extra Lime Wedges', price: 0.99),
        Addon(name: 'Fresh Mint Sprig', price: 1.99),
        Addon(name: 'Flavored Syrup', price: 2.99),
      ],
    ),
    Food(
      name: "Sparkling Elderflower Lemonade",
      description:
          'A refreshing mix of white rum, fresh lime juice, mint leaves, simple syrup, and soda water, served over ice.',
      imagePath: 'images/Drinks/drink1.jpg',
      price: 4.99,
      category: FoodCategory.drinks,
      availabeAddons: [
        Addon(name: 'Extra Lime Wedges', price: 0.99),
        Addon(name: 'Fresh Mint Sprig', price: 1.99),
        Addon(name: 'Flavored Syrup', price: 2.99),
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = '99 Main Street,USA';

  //Getter
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //Setter

  // -- Operations -- //

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddon) {
    //see if there is a cart item already with the same food and selected addon
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddon, selectedAddon);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddon: selectedAddon,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddon) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliverAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //Helper

  //generate the recipt
  String displayCartRecipt() {
    final recipt = StringBuffer();
    recipt.writeln("Here's your recipt.");
    recipt.writeln();

    // format the date to include up to seconds only

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    recipt.writeln(formattedDate);
    recipt.writeln();
    recipt.writeln('------------------------------------------------------');

    for (final cartItem in _cart) {
      recipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}');
      if (cartItem.selectedAddon.isNotEmpty) {
        recipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddon)}");
      }
      recipt.writeln();
    }
    recipt.writeln('------------------------------------------------------');
    recipt.writeln();
    recipt.writeln("Total Items: ${getTotalItemCount()}");
    recipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    recipt.writeln();
    recipt.writeln('Delivering to: $_deliveryAddress');

    return recipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name}(${_formatPrice(addon.price)})')
        .join();
  }
}
