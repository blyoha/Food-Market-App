import 'package:flutter/material.dart';

import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/market/presentation/pages/home_page.dart';
import '../config/app_icons.dart';

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
      icon: AppIcons.home_outline,
      route: 'home',
    ),
    NavItem(
      page: SizedBox.shrink(),
      label: 'Поиск',
      icon: AppIcons.search_outline,
      route: 'search',
    ),
    NavItem(
      page: CartPage(),
      label: 'Корзина',
      icon: AppIcons.basket,
      route: 'cart',
    ),
    NavItem(
      page: SizedBox.shrink(),
      label: 'Аккаунт',
      icon: AppIcons.user_outline,
      route: 'profile',
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
  final String route;

  const NavItem({
    required this.page,
    required this.label,
    required this.icon,
    required this.route,
  });
}
