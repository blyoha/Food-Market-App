import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../bloc/market_bloc.dart';
import 'dish_tag.dart';

class DishTagList extends StatefulWidget {
  final List<String> tags;

  const DishTagList({Key? key, required this.tags}) : super(key: key);

  @override
  State<DishTagList> createState() => _DishTagListState();
}

class _DishTagListState extends State<DishTagList> {
  int activeTag = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.tags.length,
      separatorBuilder: (context, index) => const Gap(8.0),
      itemBuilder: (context, index) => DishTag(
        title: widget.tags[index],
        onTap: () {
          setState(() {
            context.read<MarketBloc>().add(MarketLoad(tag: widget.tags[index]));
            activeTag = index;
          });
        },
        isActive: index == activeTag,
      ),
    );
  }
}
