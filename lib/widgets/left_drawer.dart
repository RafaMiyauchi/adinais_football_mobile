import 'package:flutter/material.dart';
import 'package:adinais_football/screens/menu.dart';
import 'package:adinais_football/screens/product_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 163, 255, 0),
            ),
            child: Column(
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "All your football needs!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // Link to Home Page
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // When tapped, navigate to the Home Page
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          // Link to Add Product Page
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            // When tapped, navigate to the Form Page
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}