import 'package:flutter/material.dart';
import 'package:freshnbloom/models/product_entry.dart';


class DetailPage extends StatelessWidget {
  final ProductEntry product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: screenWidth,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color to white
            borderRadius: BorderRadius.circular(12), // Optional: Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // Subtle shadow effect
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.fields.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Description: ${product.fields.description}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                "Stock: ${product.fields.stock}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}