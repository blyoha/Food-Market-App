import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/appbar_avatar.dart';
import '../../../../core/widgets/appbar_title.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CartBloc, CartState>(
            bloc: context.read<CartBloc>(),
            builder: (context, state) {
              if (state is CartEmpty) {
                return Center(
                  child: Text(
                    'Здесь ничего нет',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.65),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                );
              }

              if (state is CartLoaded) {
                final cart = state.cart.entries.toList();
                final price = cart
                    .map((e) => e.key.price * e.value)
                    .reduce((value, element) => value + element);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: cart.length,
                        separatorBuilder: (context, index) => const Gap(16.0),
                        itemBuilder: (context, index) => CartItem(
                          dish: cart[index].key,
                          count: cart[index].value,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Оплатить $price ₽',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
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
