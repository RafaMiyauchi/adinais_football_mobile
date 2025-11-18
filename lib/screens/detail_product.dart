import 'package:flutter/material.dart';
import 'package:adinais_football/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: const Color.fromARGB(255, 163, 255, 0),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Brand: ${product.brand}"),
            Text("Category: ${product.category}"),
            Text("Price: ${product.price}"),
            Text("Stock: ${product.stock}"),
            Text("Rating: ${product.rating}/5"),
            const SizedBox(height: 20),
            const Text(
              "Description:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(product.description),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 163, 255, 0),
                  foregroundColor: Colors.black,
                ),
                child: const Text('Back to List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}