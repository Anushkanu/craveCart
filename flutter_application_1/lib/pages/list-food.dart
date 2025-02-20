// lib/pages/list-food.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/model/food.dart';
import 'package:flutter_application_1/pages/model/cart.dart';




class ListFood extends StatefulWidget {
  const ListFood({super.key, required Cart cart});

  @override
  ListFoodState createState() => ListFoodState();
}

class ListFoodState extends State<ListFood> {
  List<Food> foods = [];
  List<Food> displayedFoods = []; // Displayed food list for filtering
  final Cart cart = Cart(); // Instantiate cart
  String searchQuery = ""; // Initialize search query

  @override
  void initState() {
    super.initState();
    foods = getFood();
    displayedFoods = foods; // Initially, display all foods
  }

  List<Food> getFood() {
    return [
      Food(
        imageURL: "assets/pasta.png",
        name: "Pasta",
        price: 680,
        rating: 4.5,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Food(
        imageURL: "assets/pizza.png",
        name: "Margherita Pizza",
        price: 700,
        rating: 4.2,
        color: Color.fromARGB(255, 254, 254, 254),
      ),
      Food(
        imageURL: "assets/momo.png",
        name: "Steamed Momo",
        price: 300,
        rating: 4.0,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Food(
        imageURL: "assets/image 4.png",
        name: "Spring Roll",
        price: 460,
        rating: 3.9,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Food(
        imageURL: "assets/wedges.jpeg",
        name: "Potatoes Wedges",
        price: 365,
        rating: 4.8,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Food(
        imageURL: "assets/chilly potatoes.jpeg",
        name: "Chilly Potatoes",
        price: 650,
        rating: 4.2,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Food(
        imageURL: "assets/panner.jpeg",
        name: "Paneer Tikka",
        price: 645,
        rating: 4.8,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      Food(
        imageURL: "assets/nachos.jpeg",
        name: "Cheese Nachos",
        price: 650,
        rating: 4.2,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    ];
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      displayedFoods = foods
          .where((food) =>
              food.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  void sortFoods(String criteria) {
    setState(() {
      if (criteria == 'Price') {
        displayedFoods.sort((a, b) => a.price.compareTo(b.price));
      } else if (criteria == 'Rating') {
        displayedFoods.sort((a, b) => b.rating.compareTo(a.rating));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
  title: const Text(
    "List of Food",
    style: TextStyle(color: Colors.white), // Text color for AppBar title
  ),
  backgroundColor: Colors.tealAccent.shade700, // AppBar background color
  actions: [
    IconButton(
      icon: const Icon(Icons.shopping_cart, color: Colors.white), // Shopping cart icon color
      onPressed: () {
        Navigator.of(context).pushNamed('/cart', arguments: cart);
      },
    ),
    PopupMenuButton<String>(
      icon: const Icon(Icons.sort, color: Colors.white), // Icon for popup menu
      onSelected: sortFoods,
      itemBuilder: (BuildContext context) {
        return {'Price', 'Rating'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice, style: TextStyle(color: Colors.black)), // Text color for popup menu items
          );
        }).toList();
      },
    ),
  ],
),

      body: Column(
        children: [
         // Search Bar
Padding(
  padding: const EdgeInsets.all(16.0),
  child: TextField(
    onChanged: _updateSearchQuery,
    decoration: InputDecoration(
      hintText: 'Search food...',
      hintStyle: TextStyle(color: Colors.grey.shade400), // Hint text color
      prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 194, 168, 230)), // Search icon color
      filled: true, // Fill the background color
      fillColor: Colors.white, // Background color of the text field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.tealAccent.shade700), // Border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.tealAccent.shade700, width: 1.5), // Enabled border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.tealAccent.shade100, width: 2), // Focused border color
      ),
    ),
  ),
),


          // Food List
          Expanded(
            child: ListView.builder(
              itemCount: displayedFoods.length,
              itemBuilder: (context, index) {
                final food = displayedFoods[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/details',
                      arguments: food,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: food.color,
                    child: Row(
                      children: [
                        Image.asset(
                          food.imageURL,
                          width: 64,
                          height: 64,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(food.name),
                            Text("\u20b9 ${food.price}"),
                            Text("Rating: ${food.rating}"),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            cart.add(food); // Add food to cart
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${food.name} added to cart!'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
