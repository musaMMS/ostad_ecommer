
import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/home_screnn.dart';
class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4,
          children: [
            HomeScreen(),
            Container(),
            Container(),

            CategoryTile(icon: Icons.tv, label: 'Electronics'),
            CategoryTile(icon: Icons.local_dining, label: 'Food'),
            CategoryTile(icon: Icons.diamond, label: 'Fashion'),
            CategoryTile(icon: Icons.bed, label: 'Furniture'),
            CategoryTile(icon: Icons.tv, label: 'Electronics'),
            CategoryTile(icon: Icons.local_dining, label: 'Food'),
            CategoryTile(icon: Icons.diamond, label: 'Fashion'),
            CategoryTile(icon: Icons.bed, label: 'Furniture'),
            CategoryTile(icon: Icons.tv, label: 'Electronics'),
            CategoryTile(icon: Icons.local_dining, label: 'Food'),
            CategoryTile(icon: Icons.diamond, label: 'Fashion'),
            CategoryTile(icon: Icons.bed, label: 'Furniture'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view,
              color: Colors.grey,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket,
              color: Colors.grey,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard,
              color: Colors.grey,
            ),
            label: 'Wish',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        elevation: 20,
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new screen when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(categoryName: label),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.teal,
          ),
          SizedBox(height: 8.0),
          Text(label, style: TextStyle(color: Colors.teal)),
        ],
      ),
    );
  }
}

// New screen that shows when a category is clicked
class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;

  CategoryDetailScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName Category'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'Welcome to the $categoryName section!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),

    );
  }
}
