import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/model/food.dart';
import 'model/cart.dart';

class CheckoutScreen extends StatelessWidget {
  final Cart cart;

  const CheckoutScreen({Key? key, required this.cart, required Food food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the total amount for items in the cart
    double totalAmount = cart.getItems().fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Removed the address display
            const SizedBox(height: 20),
            Text(
              "Total Amount: \u20b9 $totalAmount",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Add additional checkout options here
          ],
        ),
      ),
    );
  }
}


/*class CheckoutScreen extends StatelessWidget {
  final Cart cart; // Add cart parameter
  final Address? address; // Add address parameter

  const CheckoutScreen({super.key, required this.cart, this.address, required Food food});

  @override
  Widget build(BuildContext context) {
    final total = cart.totalPrice(); // Get the total price from cart

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total: \u20b9 $total', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            if (address != null) ...[
              const Text('Delivery Address:', style: TextStyle(fontSize: 20)),
              Text('${address!.street}, ${address!.city}, ${address!.state}, ${address!.zipCode}'),
            ] else ...[
              const Text('No address provided'),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement order placement logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Order Placed!')),
                );
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*class CheckoutScreen extends StatelessWidget {
  final Food food;

  const CheckoutScreen({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Image.asset(food.imageURL, width: 50, height: 50),
              title: Text(food.name),
              subtitle: Text("Price: \u20b9 ${food.price}"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement order placement logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order Placed Successfully")),
                );
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}*/
