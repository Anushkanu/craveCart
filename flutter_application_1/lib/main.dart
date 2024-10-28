// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/model/cart.dart';
import 'package:flutter_application_1/pages/model/food.dart';
import 'pages/addtocart.dart'; // Import the cart screen
import 'pages/home.dart';
import 'pages/list-food.dart';
import 'pages/detail.dart';
import 'pages/login-page.dart';
import 'pages/register-page.dart';
import 'pages/splash.dart';
import 'pages/checkout.dart';


/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Cart cart = Cart();
  
  get food => null; // Create a single Cart instance

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => const HomeScreen(),
        '/list-food': (context) => ListFood(cart: cart),
        '/details': (context) => DetailScreen(cart: cart), // Pass cart to details screen
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/cart': (context) => CartScreen(cart: cart), // Pass cart to cart screen
        '/checkout': (context) {
          final Food food = ModalRoute.of(context)!.settings.arguments as Food;
          return CheckoutScreen(food: food);} // Pass the Food instance here
      },
    );
  }
}*/


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   final Cart cart = Cart();
  
  get food => null; // Create a single Cart instance
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Food App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => const HomeScreen(),
        '/list-food': (context) => ListFood(cart: cart),
        '/details': (context) => DetailScreen(cart: cart), // Pass cart to details screen
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/cart': (context) => CartScreen(cart: cart), // Pass cart to cart screen
        '/checkout': (context) {
          final Food food = ModalRoute.of(context)!.settings.arguments as Food;
          return CheckoutScreen(food: food, cart: cart,);
         }
      },
    );
  }
}



/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => const HomeScreen(),
        '/list-food': (context) => const ListFood(),
        '/details': (context) => const DetailScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/cart': (context) => const CartScreen(), // Add cart route
      },
    );
  }
}*/
