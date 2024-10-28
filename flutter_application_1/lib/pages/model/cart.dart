// lib/model/cart.dart
import 'food.dart';
class Cart {
  // Private constructor
  Cart._privateConstructor();
  
  // Singleton instance
  static final Cart _instance = Cart._privateConstructor();
  
  // Factory constructor to return the same instance
  factory Cart() {
    return _instance;
  }

  List<Food> items = [];

  void add(Food food) {
    items.add(food);
  }

  void remove(Food food) {
    items.remove(food);
  }

  List<Food> getItems() {
    return items;
  }

  void clear() {
    items.clear();
  }

  double totalPrice() {
    return items.fold(0, (sum, item) => sum + item.price);
  }

  void addToCart(Food food) {}
}


/*
class Cart {
  final List<Food> items = [];

  void add(Food food) {
    items.add(food);
  }

  void remove(Food food) {
    items.remove(food);
  }

  List<Food> getItems() {
    return items;
  }

  int get totalItems => items.length;

  void addToCart(Food food) {}

  totalPrice() {}

  void clear() {}
}*/
