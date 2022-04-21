import 'package:amaris_test/controllers/seriesController.dart';
import 'package:amaris_test/pages/home/widgets/favoriteTab.dart';
import 'package:amaris_test/pages/home/widgets/homeTab.dart';
import 'package:amaris_test/pages/login/LoginPage.dart';
import 'package:amaris_test/services/seriesService.dart';
import 'package:amaris_test/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Favoritepage(),
    Text(
      'Recent',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<SeriesController>().loadPopulars());
    Future.microtask(
        () => context.read<SeriesController>().loadRecomendations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false),
              icon: const Icon(Icons.settings))
        ],
        backgroundColor: amarisBlack,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: amarisBlack),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              label: 'Favorites',
              backgroundColor: amarisBlack),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings_backup_restore_outlined),
              label: 'Recent',
              backgroundColor: amarisBlack),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: 'Search',
              backgroundColor: amarisBlack),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: amarisYellow,
        unselectedItemColor: amarisWhite,
        onTap: _onItemTapped,
      ),
    );
  }
}
