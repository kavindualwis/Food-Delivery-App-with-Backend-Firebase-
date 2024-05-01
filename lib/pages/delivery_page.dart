import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_recipt.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/auth/database/firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //get access to the db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    // if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurent>().displayCartRecipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ),
              );
            },
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyRecipt(),
            const SizedBox(height: 10),
            LottieBuilder.network(
              'https://lottie.host/ce96b661-1556-4147-8ec3-b56290210cbb/1J4ypWs3i8.json',
              width: 200,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  //Custom BTM NAV BAR - Message / Call delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.background,
              ),
              child: const Icon(Icons.person, size: 25),
            ),

            const SizedBox(width: 15),

            //driver details
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jhon Snow',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Text(
                    'Driver',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Icon(
                    Icons.message,
                    size: 25,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: const Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
