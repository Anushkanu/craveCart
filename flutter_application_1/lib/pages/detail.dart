import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/model/cart.dart';
import 'model/food.dart';
import 'checkout.dart'; // Import checkout screen

class DetailScreen extends StatelessWidget {
  final Cart cart; // Add cart to track items

  const DetailScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.green, // Customize app bar color
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      food.imageURL,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Price
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Price: \u20b9 ${food.price}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Rating
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Rating: ${food.rating}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  const Text(
                    "Description:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "A delicious and delightful dish made with high-quality ingredients, perfect for any occasion.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),

                  // Nutritional Facts
                  const Text(
                    "Nutritional Facts:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Calories: 400\nProtein: 15g\nCarbohydrates: 50g\nFat: 18g",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Ingredients
                  const Text(
                    "Ingredients:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "• Pasta\n• Tomatoes\n• Cheese\n• Olive oil\n• Basil\n• Salt\n• Pepper",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Buttons at the Bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cart.addToCart(food); // Add to cart
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to Cart")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text("Add to Cart"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CheckoutScreen(food: food, cart: cart,),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Buy Now"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}


/*class DetailScreen extends StatelessWidget {
  final Cart cart; // Add cart to track items

  const DetailScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.green, // Customize app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food.imageURL,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 12),

              // Price
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Price: \u20b9 ${food.price}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // Rating
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Rating: ${food.rating}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // Description
              const Text(
                "Description:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "A delicious and delightful dish made with high-quality ingredients, perfect for any occasion.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),

              // Nutritional Facts
              const Text(
                "Nutritional Facts:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Calories: 400\nProtein: 15g\nCarbohydrates: 50g\nFat: 18g",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Ingredients
              const Text(
                "Ingredients:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "• Pasta\n• Tomatoes\n• Cheese\n• Olive oil\n• Basil\n• Salt\n• Pepper",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cart.addToCart(food); // Add to cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to Cart")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text("Add to Cart"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(food: food),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Buy Now"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.green, // Customize app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food.imageURL,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 12),

              // Price
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Price: \u20b9 ${food.price}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),

              // Rating
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Rating: ${food.rating}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),

              // Description
              const Text("Description:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                "A delicious and delightful dish made with high-quality ingredients, perfect for any occasion.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),

              // Nutritional Facts
              const Text("Nutritional Facts:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Calories: 400\nProtein: 15g\nCarbohydrates: 50g\nFat: 18g",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Ingredients
              const Text("Ingredients:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "• Pasta\n• Tomatoes\n• Cheese\n• Olive oil\n• Basil\n• Salt\n• Pepper",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),

            ],
          ),
        ),
      ),
    );
  }
}*/
