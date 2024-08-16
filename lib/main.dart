// main.dart
import 'package:flutter/material.dart';
import 'qr_scanner_screen.dart'; // Import the QR scanner screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

// MainScreen with buttons for different features
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductGrid()),
                );
              },
              child: Text('Quick Find'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScannerScreen()),
                );
                if (result != null) {
                  // Handle the scanned QR code result
                  print('Scanned QR code: $result');
                  // Implement functionality after scanning
                }
              },
              child: Text('Scan and Pay'),
            ),
          ],
        ),
      ),
    );
  }
}

// ProductGrid screen with grid of products
class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final List<Map<String, String>> _products = [
    {
      'name': 'Milk',
      'image': 'assets/milk.png',
      'location': 'Aisle 5 - Section B'
    },
    {
      'name': 'Groceries',
      'image': 'assets/groceries.png',
      'location': 'Aisle 5 - Section A'
    },
    {
      'name': 'Snacks',
      'image': 'assets/snacks.png',
      'location': 'Aisle 2 - Section C'
    },
    {
      'name': 'Clothing',
      'image': 'assets/clothes.png',
      'location': 'Aisle 10 - Section D'
    },
    {
      'name': 'Electronics',
      'image': 'assets/electronics.png',
      'location': 'Aisle 15 - Section G'
    },
    {
      'name': 'Cleaning Supplies',
      'image': 'assets/cleaning supplies.png',
      'location': 'Aisle 13 - Section L'
    },
    {
      'name': 'Utensils',
      'image': 'assets/utensils.png',
      'location': 'Aisle 8 - Section L'
    },
  ];

  String _selectedProductLocation = '';

  void _showProductLocation(String location) {
    setState(() {
      _selectedProductLocation = '📍 Location: $location';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickFind'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _showProductLocation(_products[index]['location']!);
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              _products[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _products[index]['name']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              _selectedProductLocation,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
