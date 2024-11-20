import 'package:flutter/material.dart';
import 'found_input.dart'; // Import halaman baru
import 'found_detail.dart';

void main() {
  runApp(const LostNFound());
}

class LostNFound extends StatelessWidget {
  const LostNFound({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Center(
        child: Text('Home Screen',
            style: TextStyle(
                color: Colors
                    .white))), // Kalo mau ngerjain homescreen, ntar tinggal buat file/class baru, trus panggil class nya di sini
    const Center(
        child: Text('Lost Screen',
            style: TextStyle(
                color: Colors
                    .white))), // Kalo mau ngerjain lostscreen, ntar tinggal buat file/class baru, trus panggil class nya di sini
    const FoundInputScreen(), // Halaman FoundInputScreen
    const FoundDetailScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      body: _children[_currentIndex], // Menampilkan halaman sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 255, 204, 0),
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: onTabTapped, // Menangani klik
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Lost'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Found'),
        ],
      ),
    );
  }
}
