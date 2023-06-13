import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/appbar_avatar.dart';
import '../../../../core/widgets/appbar_title.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Category> categories = [
      Category(
          title: 'Пекарни и кондитерские',
          image: 'assets/images/bakery.png',
          color: Color(0xFFFFF2D2)),
      Category(
          title: 'Фастфуд',
          image: 'assets/images/fastfood.png',
          color: Color(0xFFFFEBE0)),
      Category(
          title: 'Азиатская кухня',
          image: 'assets/images/asian.png',
          color: Color(0xFFD8F5F3)),
      Category(
          title: 'Супы',
          image: 'assets/images/soups.png',
          color: Color(0xFFEFF5CF)),
    ];

    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: categories.length,
          separatorBuilder: (context, index) => const Gap(8.0),
          itemBuilder: (context, index) => CategoryCard(
            title: categories[index].title,
            image: categories[index].image,
            color: categories[index].color,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const AppBarTitle(),
      actions: const [AppBarAvatar()],
    );
  }
}
