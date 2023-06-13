import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/market/presentation/bloc/market_bloc.dart';
import 'main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Locator.injection<MarketBloc>()),
        BlocProvider(create: (context) => Locator.injection<CartBloc>())
      ],
      child: MaterialApp(
        theme: appTheme,
        title: 'Food Market App',
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}

ThemeData appTheme = ThemeData(
  fontFamily: 'SF-Pro-Display',
  scaffoldBackgroundColor: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Color(0xFF3364E0)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color(0xFF3364E0),
    unselectedItemColor: Color(0xFFA5A9B2),
    selectedLabelStyle: TextStyle(color: Color(0xFF3364E0), fontSize: 10.0),
    unselectedLabelStyle: TextStyle(color: Color(0xFFA5A9B2), fontSize: 10.0),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSpacing: 16.0,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      )),
      backgroundColor: MaterialStatePropertyAll<Color>(
        Color(0xFF3364E0),
      ),
      foregroundColor: MaterialStatePropertyAll<Color>(
        Colors.white,
      ),
      padding: MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0)),
      shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    ),
  ),
);
