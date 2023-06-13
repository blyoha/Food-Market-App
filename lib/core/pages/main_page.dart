import 'package:flutter/material.dart';

import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/market/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<NavItem> pages = const [
    NavItem(
      page: HomePage(),
      label: 'Главная',
      icon: Icons.home_outlined,
    ),
    NavItem(
      page: SizedBox.shrink(),
      label: 'Поиск',
      icon: Icons.search_rounded,
    ),
    NavItem(
      page: CartPage(),
      label: 'Корзина',
      icon: Icons.shopping_cart_outlined,
    ),
    NavItem(
      page: SizedBox.shrink(),
      label: 'Аккаунт',
      icon: Icons.person_outline_outlined,
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFE8E9EC), width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: List.generate(
            pages.length,
            (index) => BottomNavigationBarItem(
              label: pages[index].label,
              icon: Icon(pages[index].icon),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages.map((e) => e.page).toList(),
      ),
    );
  }
}

class NavItem {
  final Widget page;
  final String label;
  final IconData icon;

  const NavItem({required this.page, required this.label, required this.icon});
}
