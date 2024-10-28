// lib/pages/cart.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/model/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.cart}); // Add a cart parameter

  final Cart cart; // Store the cart instance

  @override
  Widget build(BuildContext context) {
    final items = cart.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final food = items[index];
                return ListTile(
                  leading: Image.asset(food.imageURL, width: 50, height: 50),
                  title: Text(food.name),
                  subtitle: Text("\u20b9 ${food.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.remove(food); // Remove food from cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${food.name} removed from cart!'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                      // Update the UI by calling setState in ListFood
                      Navigator.pop(context); // Navigate back to update the screen
                      Navigator.pushReplacementNamed(context, '/cart', arguments: cart);
                    },
                  ),
                );
              },
            ),
          ),
          // Total Price
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total: \u20b9 ${cart.totalPrice()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Place Order Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                placeOrder(context); // Call placeOrder method
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text("Place Order"),
            ),
          ),
        ],
      ),
    );
  }

  void placeOrder(BuildContext context) {
    if (cart.getItems().isNotEmpty) {
      // Place order logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order placed successfully!")),
      );
      cart.clear(); // Clear the cart after placing the order
      Navigator.of(context).pushReplacementNamed('/home'); // Redirect to home or another page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your cart is empty!")),
      );
    }
  }
}

/*class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required Cart cart});

  @override
  Widget build(BuildContext context) {
    final cart = ModalRoute.of(context)!.settings.arguments as Cart;
    final items = cart.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final food = items[index];
          return ListTile(
            leading: Image.asset(food.imageURL, width: 50, height: 50),
            title: Text(food.name),
            subtitle: Text("\u20b9 ${food.price}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                cart.remove(food); // Remove food from cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${food.name} removed from cart!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
                // Update the UI by calling setState in ListFood
                Navigator.pop(context); // Navigate back to update the screen
                Navigator.pushReplacementNamed(context, '/cart', arguments: cart);
              },
            ),
          );
        },
      ),
    );
  }
}*/