import 'package:flutter/material.dart';

class AppBarAvatar extends StatelessWidget {
  const AppBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.jpeg'),
        radius: 22.0,
      ),
    );
  }
}
