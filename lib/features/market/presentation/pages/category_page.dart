import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/appbar_avatar.dart';
import '../bloc/market_bloc.dart';
import '../widgets/dish_card.dart';
import '../widgets/dish_tag.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 35.0,
              child: BlocBuilder<MarketBloc, MarketState>(
                builder: (context, state) {
                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    separatorBuilder: (context, index) => const Gap(8.0),
                    itemBuilder: (context, index) =>
                        const DishTag(title: 'тэг'),
                  );
                },
              ),
            ),
            const Gap(16.0),
            Expanded(
              child: BlocBuilder<MarketBloc, MarketState>(
                bloc: context.read<MarketBloc>()..add(MarketLoad()),
                builder: (context, state) {
                  if (state is MarketLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is MarketLoaded) {
                    final dishes = state.dishes;
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 13.0,
                        mainAxisExtent: 155.0,
                        crossAxisSpacing: 8.0,
                        crossAxisCount: 3,
                      ),
                      itemCount: 7,
                      itemBuilder: (context, index) =>
                          DishCard(dish: dishes[index]),
                    );
                  }

                  if (state is MarketError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                            color: Colors.black.withOpacity(.65),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(widget.title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [AppBarAvatar()],
    );
  }
}
