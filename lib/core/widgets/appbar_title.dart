import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.black,
          weight: 2.0,
          size: 28.0,
        ),
        const Gap(4.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Санкт-Питербург',
              style: TextStyle(fontSize: 18.0),
            ),
            const Gap(4.0),
            Text(
              '12 Августа, 2023',
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
