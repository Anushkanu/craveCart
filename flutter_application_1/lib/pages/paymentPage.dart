import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Card Number Field
            const TextField(
              decoration: InputDecoration(
                labelText: "Card Number",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            // Expiry Date Field
            const TextField(
              decoration: InputDecoration(
                labelText: "Expiry Date (MM/YY)",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 15),

            // CVV Field
            const TextField(
              decoration: InputDecoration(
                labelText: "CVV",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),

            // Pay Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment processing logic here
                  // Navigate to confirmation or success page
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.tealAccent.shade700,
                ),
                child: const Text("Pay Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
